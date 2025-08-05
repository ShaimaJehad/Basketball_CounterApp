import 'package:baseketball_counter_app/cubit/counter_cubit.dart';
import 'package:baseketball_counter_app/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const PointsApp());
}

class PointsApp extends StatelessWidget {
  const PointsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFFDFDFD),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF0D47A1),
            foregroundColor: Colors.white,
            centerTitle: true,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF42A5F5),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('🏆 Points Counter')),
          body: Column(
            children: [
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Team A',
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${BlocProvider.of<CounterCubit>(context).teamAPoints}',
                        style: const TextStyle(
                          fontSize: 200,
                          color: Color(0xFF0D47A1),
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(
                            context,
                          ).TeamIncrement(team: 'A', buttonNumber: 1);
                        },
                        child: const Text('Add 1 Point'),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(
                            context,
                          ).TeamIncrement(team: 'A', buttonNumber: 2);
                        },
                        child: const Text('Add 2 Points'),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(
                            context,
                          ).TeamIncrement(team: 'A', buttonNumber: 3);
                        },
                        child: const Text('Add 3 Points'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 420,
                    child: VerticalDivider(color: Colors.grey, thickness: 1),
                  ),
                  Column(
                    children: [
                      const Text(
                        'Team B',
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${BlocProvider.of<CounterCubit>(context).teamBPoints}',
                        style: const TextStyle(
                          fontSize: 200,
                          color: Color(0xFF0D47A1),
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(
                            context,
                          ).TeamIncrement(team: 'B', buttonNumber: 1);
                        },
                        child: const Text('Add 1 Point'),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(
                            context,
                          ).TeamIncrement(team: 'B', buttonNumber: 2);
                        },
                        child: const Text('Add 2 Points'),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(
                            context,
                          ).TeamIncrement(team: 'B', buttonNumber: 3);
                        },
                        child: const Text('Add 3 Points'),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).resetPoints();
                },
                child: const Text('Reset All'),
              ),
              const SizedBox(height: 32),
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
