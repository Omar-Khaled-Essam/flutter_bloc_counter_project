import 'package:flutter_bloc/flutter_bloc.dart';

/// Cubit keeps this simple counter logic concise, without events.
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);

  void reset() => emit(0);
}
