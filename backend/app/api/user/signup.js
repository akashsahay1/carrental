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

    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res.status(409).json({ error: 'User already exists.' });
    }

    let newUser;
    if (oauthType === 'email') {
      if (!password) {
        return res.status(400).json({ error: 'Password is required for email registration.' });
      }
      const hashedPassword = await bcrypt.hash(password, 10);
      newUser = await User.create({ email, password: hashedPassword, oauthType });
    } else {
      newUser = await User.create({ email, oauthType });
    }

    const token = jwt.sign({ userId: newUser._id }, process.env.JWT_SECRET, { expiresIn: '1h' });

    res.status(201).json({ token });
  } else {
    res.status(405).json({ error: 'Method not allowed.' });
  }
};
