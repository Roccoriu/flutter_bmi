class BmiHistory {
  final int id;
  final double bmi;
  final DateTime date;
  final String name;

  const BmiHistory({
    required this.id,
    required this.bmi,
    required this.date,
    required this.name,
  });

  factory BmiHistory.fromMap(Map<String, dynamic> map) {
    return BmiHistory(
      id: map['id'],
      bmi: map['bmi'],
      date: DateTime.parse(map['date_added']),
      name: map['name'],
    );
  }
}
