import 'package:flutter/material.dart';
import 'package:sprout_pokedex/models/Pokemon.dart';

class PokemonDetailAboutPage extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetailAboutPage({required this.pokemon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Table(
        children: [
          TableRow(children: [
            const Text('Species:', style: TextStyle(fontSize: 15.0)),
            Text(pokemon.types[0], style: TextStyle(fontSize: 15.0)),
          ]),
          TableRow(children: [
            const Text('Height: ', style: TextStyle(fontSize: 15.0)),
            Text(pokemon.height.toString(), style: TextStyle(fontSize: 15.0)),
          ]),
          TableRow(children: [
            const Text('Weight: ', style: TextStyle(fontSize: 15.0)),
            Text(pokemon.weight.toString(), style: TextStyle(fontSize: 15.0)),
          ]),
          TableRow(children: [
            const Text('Abilities: ', style: TextStyle(fontSize: 15.0)),
            Text(pokemon.abilities.join(", "),
                style: TextStyle(fontSize: 15.0)),
          ]),
        ],
      ),
    );
  }
}
