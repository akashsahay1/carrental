import { NextRequest, NextResponse } from 'next/server';
import connectdb from '../../../utils/dbConnect';
import Car from '../../../models/Car';

export const GET = async (request: NextRequest) => {

  var results = {};

  try {
    await connectdb();
    const page = parseInt(request.nextUrl.searchParams.get('page')) || 1;
    const pageSize = parseInt(request.nextUrl.searchParams.get('pageSize')) || 4;
    const skip = (page - 1) * pageSize;
    const totalCars = await Car.countDocuments({});
    const cars = await Car.find().skip(skip).limit(pageSize);
    results = {'totalcars': totalCars, 'cars': cars, 'status': 1};
  } catch (error) {
    results = {'totalcars': 0, 'cars': [], 'status': 0};
  }
  return NextResponse.json(results, { status: 200 });
}