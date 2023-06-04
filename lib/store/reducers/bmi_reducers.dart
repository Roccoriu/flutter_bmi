import 'package:bmi_calculator/store/model/bmi_state.dart';
import 'package:redux/redux.dart';
import '../actions/bmi_actions.dart';

BmiState bmiStateReducer(BmiState state, action) {
  return BmiState(
    height: heightReducer(state.height, action),
    weight: weightReducer(state.weight, action),
    bmiResult: bmiReducer(state.bmiResult, action),
  );
}

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
