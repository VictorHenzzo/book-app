class AuthorEntity extends AuthorProperties {
  AuthorEntity({
    required super.name,
    required super.imageUrl,
    required super.booksCount,
    required super.id,
  });
}

class AuthorProperties {
  AuthorProperties({
    required this.name,
    required this.imageUrl,
    required this.booksCount,
    required this.id,
  });

  final String name;
  final String imageUrl;
  final int booksCount;
  final String id;
}
