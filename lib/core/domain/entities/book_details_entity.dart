import 'package:equatable/equatable.dart';

class BookDetailsEntity extends BookDetailsProperties {
  const BookDetailsEntity({
    required super.description,
    required super.isFavorite,
  });
}

class BookDetailsProperties extends Equatable {
  const BookDetailsProperties({
    required this.description,
    required this.isFavorite,
  });

  final String description;
  final bool isFavorite;

  @override
  List<Object?> get props => [
        description,
        isFavorite,
      ];
}
