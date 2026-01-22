import 'package:flutter/material.dart';
import 'package:pokedexg14/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class Counter2Page extends StatelessWidget {
  const Counter2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador - Pantalla 2'),
        actions: [
          IconButton(
            tooltip: 'Reset',
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<CounterProvider>().reset(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CounterProvider>().incremente(),
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Contador (Pantalla 2): ${counter.count}',
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Volver'),
            ),
          ],
        ),
      ),
    );
  }
}
