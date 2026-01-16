import 'package:flutter/material.dart';

class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6C63FF)),
      ),
      home: const PokedexHomePage(),
    );
  }
}

class Pokemon {
  final int id;
  final String name;
  final String imageUrl;

  const Pokemon({required this.id, required this.name, required this.imageUrl});
}

class PokedexHomePage extends StatefulWidget {
  const PokedexHomePage({super.key});

  @override
  State<PokedexHomePage> createState() => _PokedexHomePageState();
}

class _PokedexHomePageState extends State<PokedexHomePage> {
  final TextEditingController _searchCtrl = TextEditingController();
  String _query = '';

  // Demo data similar a tu screenshot
  final List<Pokemon> _all = const [
    Pokemon(
      id: 1,
      name: 'Bulbasaur',
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
    ),
    Pokemon(
      id: 12,
      name: 'Butterfree',
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/12.png',
    ),
    Pokemon(
      id: 7,
      name: 'Squirtle',
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png',
    ),
    Pokemon(
      id: 4,
      name: 'Charmander',
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png',
    ),
    Pokemon(
      id: 25,
      name: 'Pikachu',
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png',
    ),
    Pokemon(
      id: 10,
      name: 'Caterpie',
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10.png',
    ),
    Pokemon(
      id: 25,
      name: 'Pikachu',
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png',
    ),
    Pokemon(
      id: 10,
      name: 'Caterpie',
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10.png',
    ),
    Pokemon(
      id: 25,
      name: 'Pikachu',
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png',
    ),
    Pokemon(
      id: 10,
      name: 'Caterpie',
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10.png',
    ),
    Pokemon(
      id: 25,
      name: 'Pikachu',
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png',
    ),
    Pokemon(
      id: 10,
      name: 'Caterpie',
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10.png',
    ),
    Pokemon(
      id: 25,
      name: 'Pikachu',
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png',
    ),
    Pokemon(
      id: 10,
      name: 'Caterpie',
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10.png',
    ),
    Pokemon(
      id: 25,
      name: 'Pikachu',
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png',
    ),
    Pokemon(
      id: 10,
      name: 'Caterpie',
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10.png',
    ),
  ];

  final Set<int> _favorites = <int>{};

  List<Pokemon> get _filtered {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return _all;

    // Permite buscar por nombre o por número National Dex (id)
    return _all.where((p) {
      final byName = p.name.toLowerCase().contains(q);
      final byId = p.id.toString() == q;
      return byName || byId;
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    _searchCtrl.addListener(() {
      setState(() => _query = _searchCtrl.text);
    });
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = _filtered;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7FB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Your Pokédex'),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Who are you looking for? Search for a Pokémon\nby name or using its National Pokédex number.',
                style: TextStyle(color: Color(0xFF6B7280), height: 1.3),
              ),
              const SizedBox(height: 12),
              _SearchBar(controller: _searchCtrl),
              const SizedBox(height: 14),
              Expanded(
                child: GridView.builder(
                  itemCount: items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.05,
                  ),
                  itemBuilder: (context, i) {
                    final p = items[i];
                    final fav = _favorites.contains(p.id);

                    return _PokemonCard(
                      name: p.name,
                      imageUrl: p.imageUrl,
                      isFavorite: fav,
                      onToggleFavorite: () {
                        setState(() {
                          if (fav) {
                            _favorites.remove(p.id);
                          } else {
                            _favorites.add(p.id);
                          }
                        });
                      },
                      onTap: () => _showPokemonBottomSheet(p),
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

  void _showPokemonBottomSheet(Pokemon p) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      backgroundColor: Colors.white,
      builder: (_) {
        final isFav = _favorites.contains(p.id);
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '#${p.id.toString().padLeft(3, '0')}  ${p.name}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 140,
                child: Image.network(p.imageUrl, fit: BoxFit.contain),
              ),
              const SizedBox(height: 12),
              FilledButton.icon(
                onPressed: () {
                  setState(() {
                    if (isFav) {
                      _favorites.remove(p.id);
                    } else {
                      _favorites.add(p.id);
                    }
                  });
                  Navigator.pop(context);
                },
                icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
                label: Text(isFav ? 'Remove favorite' : 'Add favorite'),
              ),
              const SizedBox(height: 6),
            ],
          ),
        );
      },
    );
  }
}

class _SearchBar extends StatelessWidget {
  final TextEditingController controller;
  const _SearchBar({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            blurRadius: 14,
            offset: Offset(0, 6),
            color: Color(0x12000000),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        textInputAction: TextInputAction.search,
        decoration: const InputDecoration(
          hintText: 'Search for a Pokémon',
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        ),
      ),
    );
  }
}

class _PokemonCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;
  final VoidCallback onTap;

  const _PokemonCard({
    required this.name,
    required this.imageUrl,
    required this.isFavorite,
    required this.onToggleFavorite,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              blurRadius: 14,
              offset: Offset(0, 6),
              color: Color(0x12000000),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                iconSize: 20,
                onPressed: onToggleFavorite,
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite
                      ? const Color(0xFFEF4444)
                      : const Color(0xFF9CA3AF),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 18, 14, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Expanded(
                    child: Center(
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) => const Icon(
                          Icons.image_not_supported_outlined,
                          size: 40,
                          color: Color(0xFF9CA3AF),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
