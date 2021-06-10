class Planet {
  final String id;
  final String name;
  final String location;
  final String distance;
  final String gravity;
  final String description;
  final String image;

  const Planet(
      {required this.id,
      required this.name,
      required this.location,
      required this.distance,
      required this.gravity,
      required this.description,
      required this.image});

  factory Planet.fromJson(Map<String, dynamic> json) {
    return Planet(
        id: json['planetName'],
        name: json['planetName'],
        description: json['planetSubtitle'],
        location: "",
        distance: json['velocity1'].toString(),
        gravity: json['velocity2'].toString(),
        image: json['planetImage']);
  }
}
