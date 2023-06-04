import 'package:flutter/material.dart';

const initialBMIState = BmiState(
  bmiResult: 0,
  bmiRatings: [
    BmiRating(
      min: 0,
      max: 18.5,
      description: 'Underweight',
    ),
    BmiRating(
      min: 18.5,
      max: 25,
      description: 'Normal',
    ),
    BmiRating(
      min: 25,
      max: 30,
      description: 'Overweight',
    ),
    BmiRating(
      min: 30,
      max: 35,
      description: 'Obese',
    ),
    BmiRating(
      min: 35,
      max: 40,
      description: 'Very Obese',
    ),
    BmiRating(
      min: 40,
      max: 100,
      description: 'Morbidly Obese',
    ),
  ],
);

class BmiRating {
  final double min;
  final double max;
  final String description;

  const BmiRating({
    required this.min,
    required this.max,
    required this.description,
  });
}

@immutable
class BmiState {
  final double bmiResult;
  final List<BmiRating> bmiRatings;

  const BmiState({
    required this.bmiResult,
    required this.bmiRatings,
  });

  int getBmiRatingIndex(double bmi) {
    return bmiRatings.indexWhere((rating) => bmi <= rating.max);
  }

  @override
  String toString() {
    return 'AppState{bmi: $bmiResult}';
  }
}
