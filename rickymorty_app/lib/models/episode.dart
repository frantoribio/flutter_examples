class Episode {
  Episode({
    required this.id,
    required this.airDate,
    required this.characters,
    required this.episode,
    required this.name,
    required this.url,
    this.created,
  });

  int id;
  String airDate;
  List<String> characters;
  String episode;
  String name;
  String url;
  DateTime? created;
}
