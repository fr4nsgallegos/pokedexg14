import 'package:flutter/material.dart';
import 'package:pokedexg14/apiservice/api_service.dart';
import 'package:pokedexg14/models/pokemon_model_list.dart';
import 'package:pokedexg14/widgets/pokemon_card.dart';
import 'package:pokedexg14/widgets/search_box.dart';

// GERSON
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchCtrl = TextEditingController();

  PokemonModelList? _pokemonModelList;
  final Set<String> _favorites = {};

  Future<void> fetchPolemonModelList() async {
    _pokemonModelList = await ApiService().getPokemonList();
    setState(() {});
  }

  @override
  void initState() {
    fetchPolemonModelList();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final query = _searchCtrl.text.trim().toLowerCase();
    // final items = query.isEmpty
    //     ? _all
    //     : _all.where((p) => p.name.toLowerCase().contains(query)).toList();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 16, 18, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tu Pokedex digital',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 6),
              const Text(
                '¿A quién estás buscando? Busca un Pokemon por su nombre o usando su número de la Pokedex Nacional.',
                style: TextStyle(
                  fontSize: 13.5,
                  height: 1.25,
                  color: Color(0xFF6B7280),
                ),
              ),
              const SizedBox(height: 14),

              SearchBox(
                controller: _searchCtrl,
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 16),

              _pokemonModelList == null
                  ? Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.only(bottom: 8),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 14,
                              crossAxisSpacing: 14,
                              childAspectRatio: 0.95,
                            ),
                        itemCount: _pokemonModelList!.pokemon.length,
                        itemBuilder: (_, i) {
                          final p = _pokemonModelList!.pokemon[i];
                          final isFav = _favorites.contains(p.name);

                          return PokemonCard(
                            item: p,
                            isFavorite: isFav,
                            onToggleFavorite: () {
                              setState(() {
                                if (isFav) {
                                  _favorites.remove(p.name);
                                } else {
                                  _favorites.add(p.name);
                                }
                              });
                            },
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
