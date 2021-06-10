import 'package:atividade_2/Planet.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'PlanetRow.dart';

class HomePageBody extends StatelessWidget {
  Future<List<Planet>> fetchPlanet() async {
    final response = await http.get(Uri.parse('http://localhost:8080/planet'));
    if (response.statusCode == 200) {
      List<Planet> listOfPlanets = [];
      List<dynamic> planetsInfo =
          jsonDecode(response.body)['_embedded']['planet'];
      for (var i = 0; i < planetsInfo.length; i++) {
        var planet = Planet.fromJson(planetsInfo[i]);
        listOfPlanets.add(planet);
      }
      return listOfPlanets;
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: FutureBuilder<List<Planet>>(
        future: fetchPlanet(),
        builder: (context, snapshot) {
          List<Planet> planets = snapshot.data ?? [];
          return ListView.builder(
              itemCount: planets.length,
              padding: new EdgeInsets.symmetric(vertical: 16.0),
              itemBuilder: (context, index) => new PlanetRow(planets[index]));
        },
      ),
    );
  }
}
