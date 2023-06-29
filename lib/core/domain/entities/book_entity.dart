import 'package:equatable/equatable.dart';

class BookEntity extends BookProperties {
  const BookEntity({
    required super.imageUrl,
    required super.name,
    required super.author,
    required super.id,
  });
}

class BookProperties extends Equatable {
  const BookProperties({
    required this.imageUrl,
    required this.name,
    required this.author,
    required this.id,
  });

  final String imageUrl;
  final String name;
  final String author;
  final String id;

  @override
  List<Object?> get props => [
        imageUrl,
        name,
        author,
        id,
      ];
}
