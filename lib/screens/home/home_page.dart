import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprout_pokedex/screens/home/home_page_controller.dart';

import '../../widgets/pokemon_card.dart';

class HomePage extends StatelessWidget {
  final HomePageController pokemonController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    void getNext() {
      double end = scrollController.position.maxScrollExtent;
      double current = scrollController.position.pixels;

      if (end == current) {
        pokemonController.fetchAllPokemonData();
      }
    }

    scrollController.addListener(getNext);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(body: Obx(() {
      if (pokemonController.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else {
        return Stack(children: [
          Positioned(
            right: -screenHeight * 0.15,
            top: -screenHeight * 0.15,
            child: Opacity(
              opacity: 0.2,
              child: Image.asset(
                'assets/pokeball.png',
                width: screenWidth * 0.8,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Pokedex",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 25),
                    Expanded(
                      child: GridView.count(
                        controller: scrollController,
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.5,
                        children: List.generate(
                          pokemonController.pokemonList.length,
                          (index) {
                            return GestureDetector(
                              child: PokemonCard(
                                pokemon: pokemonController.pokemonList[index],
                              ),
                              onTap: () => Get.toNamed('/details',
                                  arguments:
                                      pokemonController.pokemonList[index]),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ]);
      }
    }));
  }
}
