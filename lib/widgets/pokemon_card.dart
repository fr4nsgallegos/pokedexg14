import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokedexg14/models/pokemon_model_list.dart';
import 'package:pokedexg14/pages/pokemon_page.dart';

class PokemonCard extends StatefulWidget {
  final Pokemon item;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  const PokemonCard({
    required this.item,
    required this.isFavorite,
    required this.onToggleFavorite,
  });

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  late Future<Color?> _dominantColor;

  Future<Color?> _getDominantColor(String urlImage) async {
    final imageProvider = NetworkImage(urlImage);
    final palleteGenerator = await PaletteGenerator.fromImageProvider(
      imageProvider,
    );
    return palleteGenerator.vibrantColor?.color;
  }

  @override
  void initState() {
    _dominantColor = _getDominantColor(widget.item.img);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _dominantColor,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final Color dominantColor = snapshot.data ?? Colors.white;
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    PokemonPage(pokemon: widget.item, color: dominantColor),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: dominantColor.withOpacity(0.4),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 10,
                  right: 10,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(999),
                    onTap: widget.onToggleFavorite,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Icon(
                        widget.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        size: 20,
                        color: widget.isFavorite
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
                        widget.item.name,
                        style: const TextStyle(
                          fontSize: 14.5,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF111827),
                        ),
                      ),
                      SizedBox(height: 8),
                      Center(
                        child: Image.network(
                          widget.item.img,
                          height: MediaQuery.of(context).size.height * 0.129,
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
          ),
        );
      },
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
