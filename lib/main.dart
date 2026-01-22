import 'package:flutter/material.dart';
import 'package:pokedexg14/pages/counter_page.dart';
import 'package:pokedexg14/pages/home_page.dart';
import 'package:pokedexg14/pages/pokedex_jack.dart';
import 'package:pokedexg14/pages/pokedexapp_arturo.dart';
import 'package:pokedexg14/providers/counter_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CounterPage(), debugShowCheckedModeBanner: false);
  }
}
