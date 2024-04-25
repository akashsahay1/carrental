// pages/api/cars/list.js

import dbConnect from '../../../utils/dbConnect';
import Car from '../../../models/Car';

export default async function handler(req, res) {
  await dbConnect();

  try {
    const cars = await Car.find();
    res.status(200).json(cars);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal server error' });
  }
}
