class BmiRating {
  final int id;
  final double min;
  final double max;
  final String ratingKey;
  final String description;

  const BmiRating({
    required this.id,
    required this.min,
    required this.max,
    required this.ratingKey,
    required this.description,
  });

  factory BmiRating.fromMap(Map<String, dynamic> map) {
    return BmiRating(
      id: map['id'],
      min: map['min'],
      max: map['max'],
      ratingKey: map['rating_key'],
      description: map['description'],
    );
  }
}
