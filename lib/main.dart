import 'package:counter_bloc_example/Bloc/Counter/counter_bloc.dart';
import 'package:counter_bloc_example/Bloc/Counter/counter_event.dart';
import 'package:counter_bloc_example/Bloc/Counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Counter App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
              return Text(
                state.num.toString(),
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Increment
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(IncrementCounter());
                    },
                    child: Text('Increment')),
                SizedBox(
                  width: 15,
                ),
                //decrement
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(DecrementCounter());
                    },
                    child: Text('Decrement'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
