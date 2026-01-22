import 'package:flutter/material.dart';
import 'package:pokedexg14/models/product_model.dart';
import 'package:pokedexg14/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  ShopPage({super.key});

  final products = [
    ProductModel(name: "CocaCola", price: 5),
    ProductModel(name: "Pan", price: 1.5),
    ProductModel(name: "Leche", price: 4),
  ];

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Tienda"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text("items: ${cart.items.length} "),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          final p = products[index];
          return ListTile(
            title: Text(p.name),
            subtitle: Text("S/ ${p.price}"),
            trailing: IconButton(
              onPressed: () {
                context.read<CartProvider>().add(p);
              },
              icon: Icon(Icons.shopping_bag_outlined),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(32),
        child: Text(
          "TOTAL: S/ ${cart.total.toStringAsFixed(2)}",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
