import 'package:bmi_calculator/store/model/bmi_state.dart';
import 'package:meta/meta.dart';

const initialState = AppState(
  bmiState: BmiState(
    height: 0,
    weight: 0,
    bmiResult: 0,
  ),
);

@immutable
class AppState {
  final BmiState bmiState;

  const AppState({
    required this.bmiState,
  });
}
