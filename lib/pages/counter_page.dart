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
          counter.incremente();
        },
        child: Icon(Icons.add),
      ),

      appBar: AppBar(title: Text("Contador - Provider")),
      body: Center(
        child: Text(
          "Contador: ${counter.count}",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
