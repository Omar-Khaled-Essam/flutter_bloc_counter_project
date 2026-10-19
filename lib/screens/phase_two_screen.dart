import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/counter_bloc.dart';

class PhaseTwoScreen extends StatelessWidget {
  const PhaseTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Phase 2: BLoC Widgets')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'BlocListener + BlocBuilder',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
              'A SnackBar appears whenever the counter reaches 5 or -5.'),
          const SizedBox(height: 12),
          BlocListener<CounterBloc, int>(
            listenWhen: (previous, current) => current == 5 || current == -5,
            listener: (context, count) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                    content: Text('Listener: counter reached $count!')));
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    BlocBuilder<CounterBloc, int>(
                      builder: (context, count) => Text(
                        '$count',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                    _CounterButtons(
                      onIncrement: () =>
                          context.read<CounterBloc>().add(CounterIncremented()),
                      onDecrement: () =>
                          context.read<CounterBloc>().add(CounterDecremented()),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(height: 36),
          const Text(
            'BlocConsumer',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
              'BlocConsumer rebuilds the value and also shows a SnackBar at 10 or -10.'),
          const SizedBox(height: 12),
          BlocConsumer<CounterBloc, int>(
            listenWhen: (previous, current) => current == 10 || current == -10,
            listener: (context, count) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                    content: Text('Consumer: counter reached $count!')));
            },
            builder: (context, count) => Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text('$count',
                        style: Theme.of(context).textTheme.displayMedium),
                    _CounterButtons(
                      onIncrement: () =>
                          context.read<CounterBloc>().add(CounterIncremented()),
                      onDecrement: () =>
                          context.read<CounterBloc>().add(CounterDecremented()),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: () =>
                context.read<CounterBloc>().add(CounterIncremented()),
            child: const Text('Increment once (shared counter)'),
          ),
        ],
      ),
    );
  }
}

class _CounterButtons extends StatelessWidget {
  const _CounterButtons({
    required this.onIncrement,
    required this.onDecrement,
  });

  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 12,
      children: [
        IconButton.filled(
          onPressed: onIncrement,
          icon: const Icon(Icons.add),
        ),
        IconButton.outlined(
          onPressed: onDecrement,
          icon: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
