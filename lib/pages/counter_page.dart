import 'package:flutter/material.dart';
import 'package:pokedexg14/pages/counter2_page.dart';
import 'package:pokedexg14/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterProvider>();
    // watch: escucho y me redibujo
    // read: solo leo y ejecuto, NO ME REDIBUJO

    // SELECT es para escuchar solamente una propiedad, esto es mucho más eficiente cuando el provider tiene muchas cosas
    final count = context.select<CounterProvider, int>((p) => p.count);

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Contador: ${counter.count}",
              style: const TextStyle(fontSize: 30),
            ),
            Divider(height: 32),
            // CONSUMER: es cuando quiero que solo una parte de la pantalla se redibuje, no toda la pantalla.
            Consumer<CounterProvider>(
              builder: (context, value, child) {
                return Text(
                  "Contador desde consumer: ${counter.count}",
                  style: const TextStyle(fontSize: 30),
                );
              },
            ),
            IconButton(
              tooltip: 'Ir a pantalla 2',
              icon: const Icon(Icons.open_in_new_sharp),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Counter2Page()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
