import 'package:bmi_calculator/store/model/bmi_state.dart';
import 'package:meta/meta.dart';

const initialState = AppState(bmiState: initialBMIState);

@immutable
class AppState {
  final BmiState bmiState;

  const AppState({
    required this.bmiState,
  });
}
