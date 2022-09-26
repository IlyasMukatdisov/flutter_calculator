import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/bloc/calculator/calculator_bloc.dart';
import 'package:flutter_calculator/bloc/calculator/calculator_bloc_state.dart';
import 'package:flutter_calculator/bloc/calculator/calculator_block_event.dart';
import 'package:flutter_calculator/screens/calculator/calculator_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CalculatorBloc>().add(const CalculatorEventInitialize());
    return BlocBuilder<CalculatorBloc, CalculatorBlocState>(
      builder: (context, state) {
        if (state is CalculatorStateCalculate) {
          return CalculatorScreen(
            state: state,
          );
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
