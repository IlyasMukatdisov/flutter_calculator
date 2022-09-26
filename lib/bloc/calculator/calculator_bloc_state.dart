import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class CalculatorBlocState {
  final String expression;
  final String result;
  final Exception? exception;
  const CalculatorBlocState({
    this.expression = '',
    this.result = '',
    this.exception,
  });
}

class CalculatorStateCalculate extends CalculatorBlocState {
  const CalculatorStateCalculate({
    super.exception,
    super.expression,
    super.result,
  });
}
