class Location {
  Location({
    required this.name,
    required this.url,
    this.id,
    this.created,
    this.dimension,
    this.residents,
    this.type,
  });

  String name;
  String url;
  int? id;
  DateTime? created;
  String? dimension;
  List<String>? residents;
  String? type;
}
