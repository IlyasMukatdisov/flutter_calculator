import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/bloc/calculator/calculator_bloc.dart';
import 'package:flutter_calculator/bloc/calculator/calculator_bloc_state.dart';
import 'package:flutter_calculator/bloc/calculator/calculator_block_event.dart';

class CalculatorScreen extends StatelessWidget {
  final CalculatorStateCalculate state;
  const CalculatorScreen({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CalculatorBloc, CalculatorBlocState>(
      listener: _handleExceptions,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Expression: ${state.expression}',
                textAlign: TextAlign.start,
              ),
              Text(
                'Result: ${state.result}',
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        _clear(context);
                      },
                      child: const Text('AC')),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(onPressed: () {}, child: const Text('⌫')),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(onPressed: () {}, child: const Text('9')),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(onPressed: () {}, child: const Text('-')),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        _addSymbol(
                            context: context,
                            symbol: '7',
                            result: state.result,
                            expression: state.expression);
                      },
                      child: const Text('7')),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _addSymbol(
                            context: context,
                            symbol: '8',
                            result: state.result,
                            expression: state.expression);
                      },
                      child: const Text('8')),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _addSymbol(
                            context: context,
                            symbol: '9',
                            result: state.result,
                            expression: state.expression);
                      },
                      child: const Text('9')),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _addSymbol(
                            context: context,
                            symbol: '-',
                            result: state.result,
                            expression: state.expression);
                      },
                      child: const Text('-')),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        _addSymbol(
                            context: context,
                            symbol: '4',
                            result: state.result,
                            expression: state.expression);
                      },
                      child: const Text('4')),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _addSymbol(
                            context: context,
                            symbol: '5',
                            result: state.result,
                            expression: state.expression);
                      },
                      child: const Text('5')),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _addSymbol(
                            context: context,
                            symbol: '6',
                            result: state.result,
                            expression: state.expression);
                      },
                      child: const Text('6')),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _addSymbol(
                            context: context,
                            symbol: '+',
                            result: state.result,
                            expression: state.expression);
                      },
                      child: const Text('+')),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        _addSymbol(
                            context: context,
                            symbol: '1',
                            result: state.result,
                            expression: state.expression);
                      },
                      child: const Text('1')),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _addSymbol(
                            context: context,
                            symbol: '2',
                            result: state.result,
                            expression: state.expression);
                      },
                      child: const Text('2')),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _addSymbol(
                            context: context,
                            symbol: '3',
                            result: state.result,
                            expression: state.expression);
                      },
                      child: const Text('3')),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _calculate(
                            context: context,
                            result: state.result,
                            expression: state.expression);
                      },
                      child: const Text('=')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _handleExceptions(context, state) {}

  void _clear(BuildContext context) {
    context.read<CalculatorBloc>().add(const CalculatorEventClear());
  }

  void _addSymbol(
      {required BuildContext context,
      required String symbol,
      required String result,
      required String expression}) {
    context.read<CalculatorBloc>().add(CalculatorEventAddSymbol(
          symbol: symbol,
          expression: expression,
          result: result,
        ));
  }

  void _calculate(
      {required BuildContext context,
      required String result,
      required String expression}) {
    context
        .read<CalculatorBloc>()
        .add(CalculatorEventCalculate(result: result, expression: expression));
  }
}
