import 'package:flutter/material.dart';
import 'package:pokedexg14/models/pokemon_model_list.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon item;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  const PokemonCard({
    required this.item,
    required this.isFavorite,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red.shade300,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            right: 10,
            child: InkWell(
              borderRadius: BorderRadius.circular(999),
              onTap: onToggleFavorite,
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  size: 20,
                  color: isFavorite
                      ? const Color(0xFFEF4444)
                      : const Color(0xFF9CA3AF),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF111827),
                  ),
                ),
                const Spacer(),
                Center(
                  child: Image.network(
                    item.img,
                    height: 78,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) {
                      return const Icon(
                        Icons.image_not_supported,
                        size: 52,
                        color: Color(0xFF9CA3AF),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 6),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PokemonCardItem {
  final String name;
  final String imageAsset;
  final Color bg;

  PokemonCardItem({
    required this.name,
    required this.imageAsset,
    required this.bg,
  });
}
