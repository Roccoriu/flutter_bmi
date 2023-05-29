import 'package:bmi_calculator/actions/actions.dart';
import 'package:bmi_calculator/model/models.dart';
import 'package:bmi_calculator/reducers/app_reducers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  final store = Store<AppState>(appReducer, initialState: initialState);

  runApp(StoreProvider(store: store, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: StoreConnector<AppState, int>(
          converter: (Store<AppState> store) => store.state.counter,
          builder: (BuildContext context, int counter) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: const Text("test"),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '$counter',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  StoreProvider.of<AppState>(context)
                      .dispatch(IncrementAction());
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            );
          },
        ));
  }
}
