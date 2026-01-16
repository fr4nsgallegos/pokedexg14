import 'package:flutter/material.dart';
import 'package:pokedexg14/models/pokemon_model_list.dart';
import 'package:pokedexg14/widgets/type_pokemon_container.dart';

class AboutTabBar extends StatelessWidget {
  Pokemon pokemon;
  Color color;

  AboutTabBar({required this.pokemon, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text("Poderes"),
          SizedBox(height: 16),
          SizedBox(
            height: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: pokemon.weaknesses.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: TypePokemonContainer(
                    type: pokemon.weaknesses[index],
                    color: color,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
