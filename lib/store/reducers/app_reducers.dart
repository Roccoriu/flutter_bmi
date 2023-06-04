import '../model/app_state.dart';
import 'bmi_reducers.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    bmiState: bmiStateReducer(state.bmiState, action),
  );
}
