import 'package:book_app/core/domain/entities/book_entity.dart';

class BookModel extends BookProperties {
  const BookModel({
    required super.imageUrl,
    required super.name,
    required super.author,
    required super.id,
  });

  factory BookModel.fromMap(final Map<String, dynamic> map) {
    return BookModel(
      imageUrl: map['cover'] as String,
      name: map['name'] as String,
      author: map['author']['name'] as String,
      id: map['id'] as String,
    );
  }

  BookEntity toEntity() {
    return BookEntity(
      imageUrl: imageUrl,
      name: name,
      author: author,
      id: id,
    );
  }
}
