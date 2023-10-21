import 'package:sprout_pokedex/interfaces/i_ability.dart';
import 'package:flutter/material.dart';

class Pokemon {
  final String name;
  final int id;
  final List<String> types;
  final double height;
  final double weight;
  final List<String> abilities;

  final Map<String, int> baseStats;

  final Color backgroundColor;

  Pokemon({
    required this.name,
    required this.id,
    required this.types,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.baseStats,
    required this.backgroundColor,
  });

// void getColor()
}
