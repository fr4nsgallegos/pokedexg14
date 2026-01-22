import 'package:flutter/material.dart';
import 'package:pokedexg14/pages/provider_example.dart/auth_provider.dart';
import 'package:pokedexg14/pages/provider_example.dart/counter_page.dart';
import 'package:pokedexg14/pages/home_page.dart';
import 'package:pokedexg14/pages/pokedex_jack.dart';
import 'package:pokedexg14/pages/pokedexapp_arturo.dart';
import 'package:pokedexg14/pages/provider_example.dart/login_page.dart';
import 'package:pokedexg14/pages/provider_example.dart/shop_page.dart';
import 'package:pokedexg14/providers/cart_provider.dart';
import 'package:pokedexg14/providers/counter_provider.dart';
import 'package:provider/provider.dart';

// CUANDO SOLO TENEMOS UN PROVIDER SE HACE DE LA SIGUIENTE FORMA
// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => CounterProvider(),
//       child: MyApp(),
//     ),
//   );
// }

// CUANDO TENEMOS MAS DE UN PROVIDER DE HACE DE LA SIGUIENTE FORMA
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: ShopPage(), debugShowCheckedModeBanner: false
      home: Consumer<AuthProvider>(
        builder: (context, auth, child) {
          return auth.isLogged ? ShopPage() : LoginPage();
        },
      ),
    );
  }
}
