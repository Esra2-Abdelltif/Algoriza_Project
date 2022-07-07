import 'package:flutter/foundation.dart';

@immutable
abstract class CounterStates
{
  const CounterStates();
}

class CounterInitialState extends CounterStates {}
class CounterIncrementState extends CounterStates {
  final int Counter;

  CounterIncrementState(this.Counter);
}
class CounterDecrementState extends CounterStates{
  final int Counter;

  CounterDecrementState(this.Counter);
}
