import 'package:flutter/material.dart';
import 'package:pokedexg14/models/pokemon_model_list.dart';
import 'package:pokedexg14/widgets/about_tab_bar.dart';
import 'package:pokedexg14/widgets/type_pokemon_container.dart';

class PokemonPage extends StatelessWidget {
  Pokemon pokemon;
  Color color;

  PokemonPage({required this.pokemon, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors
          .white, //le colocamos blanco para que conserve el color del pokemon card
      child: Scaffold(
        backgroundColor: color.withOpacity(0.4),
        appBar: AppBar(backgroundColor: color.withOpacity(0.05)),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(pokemon.img, height: 250, fit: BoxFit.cover),
                Text(
                  pokemon.name,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    pokemon.type.length,
                    (index) => TypePokemonContainer(
                      type: pokemon.type[index].name,
                      color: color,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Spacer(),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(35),
                      ),
                    ),
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          TabBar(
                            tabs: [
                              Tab(text: "About"),
                              Tab(text: "Evolution"),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                AboutTabBar(pokemon: pokemon, color: color),
                                Text("2"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
