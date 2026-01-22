import 'package:flutter/material.dart';
import 'package:pokedexg14/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("Carrito")),
      body: cart.items.isEmpty
          ? const Center(child: Text("Tu carrito está vacío"))
          : ListView.separated(
              itemCount: cart.items.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final item = cart.items[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text("S/ ${item.price}"),
                );
              },
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          "TOTAL: S/ ${cart.total.toStringAsFixed(2)}",
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
