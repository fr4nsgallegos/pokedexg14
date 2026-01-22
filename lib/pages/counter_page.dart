import 'package:flutter/material.dart';
import 'package:pokedexg14/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterProvider>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // counter.incremente();
          context.read<CounterProvider>().incremente();
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Contador - Provider"),
        actions: [
          IconButton(
            tooltip: 'Reset',
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // counter.reset();
              context.read<CounterProvider>().reset();
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Contador: ${counter.count}",
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
