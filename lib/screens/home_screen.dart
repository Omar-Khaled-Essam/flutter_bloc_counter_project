import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/counter_bloc.dart';
import '../blocs/theme_bloc.dart';
import 'phase_one_screen.dart';
import 'phase_two_screen.dart';
import 'phase_three_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter BLoC Mini Project'),
        actions: [
          IconButton(
            tooltip: 'Toggle theme',
            onPressed: () => context.read<ThemeBloc>().add(ThemeToggled()),
            icon: Icon(
              context.watch<ThemeBloc>().state == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Learn BLoC step by step',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          const Text(
              'Choose a phase to test its counter and state-management widgets.'),
          const SizedBox(height: 20),
          _PhaseTile(
            title: 'Phase 1 — CounterBloc & ThemeBloc',
            subtitle: 'Increment/decrement events and light/dark theme.',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PhaseOneScreen()),
            ),
          ),
          _PhaseTile(
            title: 'Phase 2 — Listener, Builder & Consumer',
            subtitle: 'SnackBar listener, reactive counter, combined consumer.',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PhaseTwoScreen()),
            ),
          ),
          _PhaseTile(
            title: 'Phase 3 — Complete CounterCubit App',
            subtitle:
                'Increment, decrement, negative dialog, and ±10 messages.',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PhaseThreeScreen()),
            ),
          ),
        ],
      ),
    );
  }
}

class _PhaseTile extends StatelessWidget {
  const _PhaseTile({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
