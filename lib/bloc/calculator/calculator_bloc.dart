import 'package:bloc/bloc.dart';
import 'package:flutter_calculator/bloc/calculator/calculator_bloc_state.dart';
import 'package:flutter_calculator/bloc/calculator/calculator_block_event.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorBloc extends Bloc<CalculatorBlocEvent, CalculatorBlocState> {
  CalculatorBloc() : super(const CalculatorStateCalculate()) {
    on<CalculatorEventInitialize>(
      (event, emit) => const CalculatorStateCalculate(),
    );

    on<CalculatorEventAddSymbol>(
      (event, emit) {
        final exp = "${event.expression}${event.symbol}";
        emit(CalculatorStateCalculate(
          expression: exp,
          result: event.result,
          exception: null,
        ));
      },
    );
    on<CalculatorEventDeleteSymbol>(
      (event, emit) {
        if (event.expression.isNotEmpty) {
          emit(CalculatorStateCalculate(
            expression:
                event.expression.substring(0, event.expression.length - 1),
            result: event.result,
            exception: null,
          ));
        }
      },
    );
    on<CalculatorEventClear>(
      (event, emit) {
        emit(const CalculatorStateCalculate(
          expression: '',
          result: '',
          exception: null,
        ));
      },
    );

    on<CalculatorEventCalculate>(
      (event, emit) {
        try {
          Parser p = Parser();
          Expression exp = p.parse(event.expression);
          double eval = exp.evaluate(EvaluationType.REAL, ContextModel());
          emit(CalculatorStateCalculate(
              expression: event.expression,
              result: eval.toString(),
              exception: null));
        } on Exception catch (e) {
          emit(CalculatorStateCalculate(
              exception: e,
              expression: event.expression,
              result: event.result));
        }
      },
    );
  }
}
