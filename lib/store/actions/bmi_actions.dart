import '../model/bmi_state.dart';

class SetHeightAction {
  final double payload;

  SetHeightAction(this.payload);
}

class SetWeightAction {
  final double payload;

  SetWeightAction(this.payload);
}

class SetBmiResultAction {
  final double payload;

  SetBmiResultAction(this.payload);
}

class SetBmiRatingAction {
  final List<BmiRating> payload;

  SetBmiRatingAction(this.payload);
}
