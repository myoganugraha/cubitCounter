import 'package:analisa_flutter/cubit/CounterCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counterObserver.dart';

void main() {
  Bloc.observer = CounterObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CounterCubit(0),
        child: CounterView());
  }
}


class CounterView extends StatelessWidget {
  const CounterView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(title: Text('Counter App')),
          body: Center(
            child: BlocBuilder<CounterCubit, int>(
              builder: (context, state) {
                return Text('$state', 
                style: Theme.of(context).textTheme.headline4);
              },
            ),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () => context.bloc<CounterCubit>().increment(),
              ),
              SizedBox(height: 10),
              FloatingActionButton(
                child:  Icon(Icons.remove),
                onPressed: () => context.bloc<CounterCubit>().decrement(),
              ),
            ],
          ),
        );
  }
}