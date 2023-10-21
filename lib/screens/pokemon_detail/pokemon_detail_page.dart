import 'package:flutter/material.dart';
import 'package:sprout_pokedex/screens/pokemon_detail/pokemon_detail_about/pokemon_detail_about_page.dart';
import 'package:sprout_pokedex/screens/pokemon_detail/pokemon_detail_base_stats/pokemon_detail_base_stats_page.dart';
import 'package:sprout_pokedex/screens/pokemon_detail/pokemon_detail_evolution/pokemon_detail_evolution_page.dart';
import 'package:sprout_pokedex/screens/pokemon_detail/pokemon_detail_moves/pokemon_detail_moves_page.dart';
import 'package:sprout_pokedex/widgets/capsule_poketype.dart';
import 'package:get/get.dart';
import 'package:sprout_pokedex/models/Pokemon.dart';

class PokemonDetailPage extends StatelessWidget {
  final pokemon = Get.arguments as Pokemon;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return
      Scaffold(
        backgroundColor: pokemon.backgroundColor,
        body: Stack(children: [
          Center(
            child: Align(
              alignment: Alignment.centerRight,
              child: Opacity(
                opacity: 0.2,
                child: Image.asset(
                  'assets/pokeball.png',
                  width: screenWidth * 0.8,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 50),
                          Text(
                            pokemon.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              for (var type in pokemon.types)
                                Row(
                                  children: [
                                    CapsulePokeType(type),
                                    SizedBox(width: screenWidth * 0.007),
                                  ],
                                ),
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                      Text(
                        "#${pokemon.id.toString()}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 250),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PokemonTabs(pokemon: pokemon)),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 200.0),
            child: Center(
              child: Image.network(
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemon
                    .id}.png",
                height: screenHeight * 0.4,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SafeArea(
              child: BackButton(
                color: Colors.white,
              )),
        ]),
      );
  }
}

class PokemonTabs extends StatelessWidget {
  final Pokemon pokemon;

  PokemonTabs({required this.pokemon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Card(
        elevation: 0,
        // margin: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            const TabBar(
              tabs: <Widget>[
                Tab(
                    child: Text(
                      "About",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    )),
                Tab(
                    child: Text(
                      "Base Stats",
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    )),
                Tab(
                    child: Text(
                      "Evolution",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    )),
                Tab(
                    child: Text(
                      "Moves",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    )),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  PokemonDetailAboutPage(pokemon: pokemon),
                  PokemonDetailBaseStatsPage(pokemon: pokemon),
                  PokemonDetailEvolutionPage(),
                  PokemonDetailMovesPage()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
