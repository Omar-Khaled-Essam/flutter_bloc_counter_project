import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/counter_cubit.dart';

class PhaseThreeScreen extends StatelessWidget {
  const PhaseThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Phase 3: CounterCubit')),
      body: BlocListener<CounterCubit, int>(
        listenWhen: (previous, current) => current < 0 && previous >= 0,
        listener: (context, count) {
          showDialog<void>(
            context: context,
            builder: (dialogContext) => AlertDialog(
              title: const Text('Negative counter'),
              content: Text('The counter is now $count.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        },
        child: BlocConsumer<CounterCubit, int>(
          listenWhen: (previous, current) => current == 10 || current == -10,
          listener: (context, count) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(content: Text('Milestone reached: $count')),
              );
          },
          builder: (context, count) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Current counter value'),
                    const SizedBox(height: 8),
                    Text(
                      '$count',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 24),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 16,
                      runSpacing: 12,
                      children: [
                        FilledButton.icon(
                          onPressed: () =>
                              context.read<CounterCubit>().increment(),
                          icon: const Icon(Icons.add),
                          label: const Text('Increment'),
                        ),
                        OutlinedButton.icon(
                          onPressed: () =>
                              context.read<CounterCubit>().decrement(),
                          icon: const Icon(Icons.remove),
                          label: const Text('Decrement'),
                        ),
                        TextButton.icon(
                          onPressed: () => context.read<CounterCubit>().reset(),
                          icon: const Icon(Icons.restart_alt),
                          label: const Text('Reset'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'A dialog appears when the value crosses below zero. '
                      'A SnackBar appears at 10 and -10.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
