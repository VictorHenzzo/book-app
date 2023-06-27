class BookEntity extends BookProperties {
  BookEntity({
    required super.imageUrl,
    required super.name,
    required super.author,
    required super.id,
  });
}

class BookProperties {
  BookProperties({
    required this.imageUrl,
    required this.name,
    required this.author,
    required this.id,
  });

  final String imageUrl;
  final String name;
  final String author;
  final String id;
}
