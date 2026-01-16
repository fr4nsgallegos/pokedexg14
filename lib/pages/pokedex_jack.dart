import 'package:flutter/material.dart';

class JackPage extends StatelessWidget {
  JackPage({super.key});
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 24, top: 20),
              child: Text(
                "Your Pokédex",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text(
                "Who are you looking for? Search for a Pokémon by name or using its National Pokédex number.",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),

            SearchPokemon(controller: _searchController, function: () {}),

            // COnsumir api
          ],
        ),
      ),
    );
  }
}

class PokemonCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final Color backgroundColor;
  final VoidCallback? onFavoriteTap;

  const PokemonCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.backgroundColor,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFF4A4A4A),
                ),
              ),
              GestureDetector(
                onTap: onFavoriteTap,
                child: const Icon(
                  Icons.favorite_border,
                  color: Colors.grey,
                  size: 24,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Center(child: Image.network(imageUrl, fit: BoxFit.contain)),
          ),
        ],
      ),
    );
  }
}

class SearchPokemon extends StatelessWidget {
  TextEditingController controller;
  VoidCallback function;
  SearchPokemon({required this.controller, required this.function, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "Buscar un pokemon",
          hintStyle: TextStyle(color: Colors.grey.shade700),
          filled: true,
          suffixIcon: IconButton(
            onPressed: function,
            icon: Icon(Icons.search, color: Colors.white),
          ),
          fillColor: Colors.black.withOpacity(0.3),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
        validator: (value) {
          if (value != null && value.isEmpty) {
            return "El campo es obligatorio";
          } else {
            return null;
          }
        },
      ),
    );
  }
}
