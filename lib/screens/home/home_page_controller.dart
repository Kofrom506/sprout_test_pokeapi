import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprout_pokedex/models/Pokemon.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePageController extends GetxController {
  var isLoading = true.obs;
  var pokemonList = <Pokemon>[].obs;
  int offset = 0;

  @override
  void onInit() {
    super.onInit();
    fetchAllPokemonData();
  }

  Future<void> fetchAllPokemonData() async {
    try {
      isLoading(true);

      final response = await http.get(Uri.parse(
          'https://pokeapi.co/api/v2/pokemon?limit=20&offset=$offset'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final results = data['results'] as List<dynamic>;

        for (var result in results) {
          print(result);
          final pokemonData = await fetchPokemonData(result['url']);
          pokemonList.add(pokemonData);
        }

        offset += results.length;
      }
    } finally {
      isLoading(false);
    }
  }

  Future<Pokemon> fetchPokemonData(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final types = data['types']
          .map((type) => type['type']['name'])
          .cast<String>()
          .toList();
      final abilities = data['abilities']
          .map((ability) => ability['ability']['name'])
          .cast<String>()
          .toList();

      final baseStatsData = (data['stats'] as List).map(
        (stat) => MapEntry<String, int>(
          stat['stat']['name'],
          stat['base_stat'],
        ),
      );

      final baseStats = Map.fromEntries(baseStatsData);
      final Color pokeColor;

      switch (types[0]) {
        case 'grass':
          pokeColor = Colors.green;
        case 'fire':
          pokeColor = Colors.red;
        case 'water':
          pokeColor = Colors.blue;
        case 'electric':
          pokeColor = Colors.teal;
        case 'psychic':
          pokeColor = Colors.purple;
        case 'rock':
          pokeColor = Colors.brown;
        case 'ice':
          pokeColor = Colors.cyan;
        case 'ghost':
          pokeColor = Colors.indigo;
        case 'bug':
          pokeColor = Colors.orange;
        case 'dark':
          pokeColor = Colors.black;
        case 'dragon':
          pokeColor = Colors.purpleAccent;
        default:
          pokeColor = Colors.grey;
      }

      return Pokemon(
          name: data['name'],
          id: data['id'],
          types: types,
          height: data['height'] / 10,
          weight: data['weight'] / 10,
          abilities: abilities,
          baseStats: baseStats,
          backgroundColor: pokeColor);
    } else {
      throw Exception('err');
    }
  }
}
