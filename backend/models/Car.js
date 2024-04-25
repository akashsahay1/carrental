const mongoose = require('mongoose');

const carSchema = new mongoose.Schema({
  make: { type: String, required: true },
  model: { type: String, required: true },
  year: { type: Number, required: true },
  // Add other fields as needed
});

module.exports = mongoose.models.Car || mongoose.model('Car', carSchema);