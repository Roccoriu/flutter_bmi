import 'package:redux/redux.dart';
import '../actions/actions.dart';

final heightReducer = TypedReducer<double, SetHeightAction>(_setHeightActionReducer);

double _setHeightActionReducer(double state, SetHeightAction action) {
  return action.payload;
}

final weightReducer = TypedReducer<double, SetWeightAction>(_setWeightActionReducer);

double _setWeightActionReducer(double state, SetWeightAction action) {
  return action.payload;
}

final bmiReducer = TypedReducer<double, SetBmiResultAction>(_setBmiResultActionReducer);

double _setBmiResultActionReducer(double state, SetBmiResultAction action) {
  return action.payload;
}
