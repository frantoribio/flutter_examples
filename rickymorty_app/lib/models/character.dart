import 'location.dart';

class Character {
  Character({
    required this.id,
    required this.episode,
    required this.gender,
    required this.image,
    required this.name,
    required this.species,
    required this.status,
    required this.type,
    required this.url,
    this.created,
    this.location,
    this.origin,
  });

  int id;
  List<String> episode;
  String gender;
  String image;
  String name;
  String species;
  String status;
  String type;
  String url;
  DateTime? created;
  Location? location;
  Location? origin;
}
