import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/counter_bloc.dart';
import '../blocs/theme_bloc.dart';

class PhaseOneScreen extends StatelessWidget {
  const PhaseOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Phase 1: BLoCs')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text('CounterBloc'),
                    const SizedBox(height: 8),
                    BlocBuilder<CounterBloc, int>(
                      builder: (context, count) => Text(
                        '$count',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 12,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () => context
                              .read<CounterBloc>()
                              .add(CounterIncremented()),
                          icon: const Icon(Icons.add),
                          label: const Text('Increment'),
                        ),
                        OutlinedButton.icon(
                          onPressed: () => context
                              .read<CounterBloc>()
                              .add(CounterDecremented()),
                          icon: const Icon(Icons.remove),
                          label: const Text('Decrement'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: ListTile(
                leading: const Icon(Icons.palette_outlined),
                title: const Text('ThemeBloc'),
                subtitle: Text(
                  context.watch<ThemeBloc>().state == ThemeMode.light
                      ? 'Current theme: Light'
                      : 'Current theme: Dark',
                ),
                trailing: ElevatedButton(
                  onPressed: () =>
                      context.read<ThemeBloc>().add(ThemeToggled()),
                  child: const Text('Toggle'),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
                'Use the theme button in the app bar too, then return here to see the current mode.'),
          ],
        ),
      ),
    );
  }
}
