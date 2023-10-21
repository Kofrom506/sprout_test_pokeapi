import 'package:flutter/material.dart';
import 'package:sprout_pokedex/models/Pokemon.dart';

class PokemonDetailBaseStatsPage extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetailBaseStatsPage({required this.pokemon, Key? key})
      : super(key: key);

  void onInit() {
    print(pokemon.baseStats);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Table(

        children: [
          TableRow(children: [
            Text("Hp", style: TextStyle(fontSize: 15.0)),
            Text(pokemon.baseStats["hp"].toString(),
                style: TextStyle(fontSize: 15.0)),
            Container(
              height: 15,
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackShape: CustomTrackShape(),
                  thumbShape: SliderComponentShape.noThumb,
                ),
                child: Slider(
                  value: (pokemon.baseStats["hp"]?.toDouble() ?? 0) / 100,
                  activeColor: Colors.red,
                  inactiveColor: Colors.grey,
                  allowedInteraction: SliderInteraction.tapOnly,
                  onChanged: (x) {},
                ),
              ),
            ),
          ]),

          TableRow(children: [
            Text('Attack', style: TextStyle(fontSize: 15.0)),
            Text(pokemon.baseStats["attack"].toString(),
                style: TextStyle(fontSize: 15.0)),
            Container(
              height: 15,
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackShape: CustomTrackShape(),
                  thumbShape: SliderComponentShape.noThumb,
                ),
                child: Slider(
                  value: (pokemon.baseStats["attack"]?.toDouble() ?? 0) / 100,
                  activeColor: Colors.green,
                  inactiveColor: Colors.grey,
                  allowedInteraction: SliderInteraction.tapOnly,
                  onChanged: (x) {},
                ),
              ),
            ),
          ]),
          TableRow(children: [
            Text('Defense', style: TextStyle(fontSize: 15.0)),
            Text(pokemon.baseStats["defense"].toString(),
                style: TextStyle(fontSize: 15.0)),
            Container(
              height: 15,
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackShape: CustomTrackShape(),
                  thumbShape: SliderComponentShape.noThumb,
                ),
                child: Slider(
                  value: (pokemon.baseStats["defense"]?.toDouble() ?? 0) / 100,
                  activeColor: Colors.red,
                  inactiveColor: Colors.grey,
                  allowedInteraction: SliderInteraction.tapOnly,
                  onChanged: (x) {},
                ),
              ),
            ),
          ]),
          TableRow(children: [
            Text('Sp.Atk', style: TextStyle(fontSize: 15.0)),
            Text(pokemon.baseStats["special-attack"].toString(),
                style: TextStyle(fontSize: 15.0)),
            Container(
              height: 15,
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackShape: CustomTrackShape(),
                  thumbShape: SliderComponentShape.noThumb,
                ),
                child: Slider(
                  value:
                  (pokemon.baseStats["special-attack"]?.toDouble() ?? 0) /
                      100,
                  activeColor: Colors.green,
                  inactiveColor: Colors.grey,
                  allowedInteraction: SliderInteraction.tapOnly,
                  onChanged: (x) {},
                ),
              ),
            ),
          ]),
          TableRow(children: [
            Text(
              'Sp.Def',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            Text(pokemon.baseStats["special-defense"].toString(),
                style: TextStyle(fontSize: 15.0)),
            Container(
              height: 15,
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackShape: CustomTrackShape(),
                  thumbShape: SliderComponentShape.noThumb,
                ),
                child: Slider(
                  value:
                  (pokemon.baseStats["special-defense"]?.toDouble() ?? 0) /
                      100,
                  activeColor: Colors.green,
                  inactiveColor: Colors.grey,
                  allowedInteraction: SliderInteraction.tapOnly,
                  onChanged: (x) {},
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double? trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
