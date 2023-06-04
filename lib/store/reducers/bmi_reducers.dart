import 'package:bmi_calculator/store/model/bmi_state.dart';
import 'package:redux/redux.dart';
import '../actions/bmi_actions.dart';

BmiState bmiStateReducer(BmiState state, action) {
  return BmiState(
    bmiResult: bmiReducer(state.bmiResult, action),
    bmiRatings: bmiRatingsReducer(state.bmiRatings, action),
  );
}

final bmiReducer = TypedReducer<double, SetBmiResultAction>(_setBmiResultActionReducer);

double _setBmiResultActionReducer(double state, SetBmiResultAction action) {
  return action.payload;
}

final bmiRatingsReducer = TypedReducer<List<BmiRating>, SetBmiRatingAction>(_setBmiRatingActionReducer);

List<BmiRating> _setBmiRatingActionReducer(List<BmiRating> state, SetBmiRatingAction action) {
  return action.payload;
}
