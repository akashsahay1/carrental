const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
  email: { type: String, required: true, unique: true },
  password: { type: String },
  oauthType: { type: String, required: true, enum: ['email', 'google', 'facebook'] },
  // Add other fields as needed
});

module.exports = mongoose.models.User || mongoose.model('User', userSchema);