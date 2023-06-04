import 'package:meta/meta.dart';

const initialState = AppState(
  height: 0,
  weight: 0,
  bmiResult: 0,
);

@immutable
class AppState {
  final double height;
  final double weight;
  final double bmiResult;

  const AppState({required this.height, required this.weight, required this.bmiResult});
  @override
  String toString() {
    return 'AppState{counter: $height, title: $weight, reduxSetup: $bmiResult}';
  }
}
