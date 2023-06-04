import '../model/app_state.dart';
import 'bmi_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    height: heightReducer(state.height, action),
    weight: weightReducer(state.weight, action),
    bmiResult: bmiReducer(state.bmiResult, action),
  );
}
