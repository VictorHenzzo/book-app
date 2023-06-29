import 'package:equatable/equatable.dart';

class AuthorEntity extends AuthorProperties {
  AuthorEntity({
    required super.name,
    required super.imageUrl,
    required super.booksCount,
    required super.id,
  });
}

class AuthorProperties extends Equatable {
  const AuthorProperties({
    required this.name,
    required this.imageUrl,
    required this.booksCount,
    required this.id,
  });

  final String name;
  final String imageUrl;
  final int booksCount;
  final String id;

  @override
  List<Object?> get props => [
        name,
        imageUrl,
        booksCount,
        id,
      ];
}
