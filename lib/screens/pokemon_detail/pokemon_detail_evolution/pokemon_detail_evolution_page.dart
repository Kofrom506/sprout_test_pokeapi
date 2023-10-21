import 'package:flutter/material.dart';

class PokemonDetailEvolutionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.build,
            size: 100.0,
            color: Colors.orange,
          ),
          SizedBox(height: 20.0),
          Text(
            'Page under construction.',
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
