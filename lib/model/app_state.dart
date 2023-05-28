import 'package:meta/meta.dart';

const initialState = AppState(
  title: "Test :)",
  reduxSetup: false,
  counter: 0,
);

@immutable
class AppState {
  final int counter;
  final String title;
  final bool reduxSetup;

  const AppState(
      {required this.title, required this.reduxSetup, required this.counter});

  @override
  String toString() {
    return 'AppState{counter: $counter, title: $title, reduxSetup: $reduxSetup}';
  }
}
