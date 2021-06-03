import 'package:atividade_2/Planet.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'PlanetRow.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new ListView.builder(
          itemBuilder: (context, index) => new PlanetRow(planets[index]),
          itemCount: planets.length,
          padding: new EdgeInsets.symmetric(vertical: 16.0)),
    );
    // return new PlanetRow(planets[1]);
  }
}
