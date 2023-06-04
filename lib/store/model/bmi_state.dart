class BmiState {
  final double height;
  final double weight;
  final double bmiResult;

  const BmiState({required this.height, required this.weight, required this.bmiResult});

  @override
  String toString() {
    return 'AppState{counter: $height, title: $weight, reduxSetup: $bmiResult}';
  }
}
