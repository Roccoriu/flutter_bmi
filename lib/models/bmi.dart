class BmiRating {
  final int id;
  final double min;
  final double max;
  final String description;

  const BmiRating({
    required this.id,
    required this.min,
    required this.max,
    required this.description,
  });

  factory BmiRating.fromMap(Map<String, dynamic> map) {
    return BmiRating(
      id: map['id'],
      min: map['min'],
      max: map['max'],
      description: map['description'],
    );
  }
}
