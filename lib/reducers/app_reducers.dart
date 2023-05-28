import 'package:bmi_calculator/model/models.dart';
import 'package:bmi_calculator/reducers/increment_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    title: state.title,
    reduxSetup: state.reduxSetup,
    counter: incrementReducer(state.counter, action),
  );
}
