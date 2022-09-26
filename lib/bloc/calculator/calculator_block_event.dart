import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class CalculatorBlocEvent {
  final String result;
  final String expression;
  const CalculatorBlocEvent({this.result = '', this.expression = ''});
}

class CalculatorEventInitialize extends CalculatorBlocEvent {
  const CalculatorEventInitialize({super.result, super.expression});
}

class CalculatorEventAddSymbol extends CalculatorBlocEvent {
  final String symbol;
  const CalculatorEventAddSymbol(
      {required this.symbol, super.result, super.expression});
}

class CalculatorEventDeleteSymbol extends CalculatorBlocEvent {
  const CalculatorEventDeleteSymbol({super.result, super.expression});
}

class CalculatorEventClear extends CalculatorBlocEvent {
  const CalculatorEventClear({super.result, super.expression});
}

class CalculatorEventCalculate extends CalculatorBlocEvent {
  const CalculatorEventCalculate({super.result, super.expression});
}
