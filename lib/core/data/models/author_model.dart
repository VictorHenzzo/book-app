import 'package:book_app/core/domain/entities/author_entity.dart';

class AuthorModel extends AuthorProperties {
  AuthorModel({
    required super.name,
    required super.imageUrl,
    required super.booksCount,
    required super.id,
  });

  factory AuthorModel.fromMap(Map<String, dynamic> map) {
    return AuthorModel(
      name: map['name'] as String,
      imageUrl: map['imageUrl'] as String,
      booksCount: map['booksCount'] as int,
      id: map['id'] as String,
    );
  }

  AuthorEntity toEntity() {
    return AuthorEntity(
      name: name,
      imageUrl: imageUrl,
      booksCount: booksCount,
      id: id,
    );
  }
}
