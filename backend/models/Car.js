const mongoose = require('mongoose');
const carSchema = new mongoose.Schema({
  name: { type: String, required: true },  
  regNumber: { type: String, required: true },
  year: { type: Number, required: true },
  make: { type: String, required: true },
  model: { type: String, required: true },
  features: { type: Array, required: false },
  imageUrl: { type: String, required: true }
});

module.exports = mongoose.models.Car || mongoose.model('Car', carSchema); 