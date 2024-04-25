import dbConnect from '../../../utils/dbConnect';
import User from '../../../models/User';
import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';

export default async (req, res) => {
  await dbConnect();

  if (req.method === 'POST') {
    const { email, password, oauthType } = req.body;
    if (!email || !oauthType) {
      return res.status(400).json({ error: 'Email and OAuth type are required.' });
    }

    const user = await User.findOne({ email });
    if (!user) {
      return res.status(404).json({ error: 'User not found.' });
    }

    if (oauthType === 'email') {
      if (!password) {
        return res.status(400).json({ error: 'Password is required for email login.' });
      }
      const isMatch = await bcrypt.compare(password, user.password);
      if (!isMatch) {
        return res.status(401).json({ error: 'Invalid credentials.' });
      }
    } else if (user.oauthType !== oauthType) {
      return res.status(401).json({ error: `User did not sign up with ${oauthType}.` });
    }

    const token = jwt.sign({ userId: user._id }, process.env.JWT_SECRET, { expiresIn: '1h' });

    res.status(200).json({ token });
  } else {
    res.status(405).json({ error: 'Method not allowed.' });
  }
};
