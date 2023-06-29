import 'package:book_app/core/domain/entities/book_details_entity.dart';

class BookDetailsModel extends BookDetailsProperties {
  const BookDetailsModel({
    required super.description,
    required super.isFavorite,
  });

  factory BookDetailsModel.fromMap(
    final Map<String, dynamic> map,
  ) {
    return BookDetailsModel(
      description: map['description'] as String,
      isFavorite: map['isFavorite'] as bool,
    );
  }

  BookDetailsEntity toEntity() {
    return BookDetailsEntity(
      description: description,
      isFavorite: isFavorite,
    );
  }
}
