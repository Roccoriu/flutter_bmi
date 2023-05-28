import 'package:redux/redux.dart';
import 'package:bmi_calculator/actions/actions.dart';

final incrementReducer =
    TypedReducer<int, IncrementAction>(_incrementActionReducer);

int _incrementActionReducer(int state, IncrementAction action) {
  return state + 1;
}
