import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprout_pokedex/screens/home/home_page.dart';
import 'package:sprout_pokedex/widgets/pokemon_card.dart';

import 'screens/pokemon_detail/pokemon_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pokedex',
      initialRoute: "/",
      defaultTransition: Transition.fadeIn,
      getPages: [
        GetPage(
          name: '/home',
          page: () => HomePage(),
        ),
        GetPage(
          name: '/details',
          page: () => PokemonDetailPage(),
        ),
      ],
      home: Scaffold(body: HomePage()),
    );
  }
}
