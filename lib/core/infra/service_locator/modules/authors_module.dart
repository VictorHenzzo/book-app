import 'package:book_app/core/data/repositories/author_repository_impl.dart';
import 'package:book_app/core/domain/repositories/author_repository.dart';
import 'package:book_app/core/domain/use_cases/authors/fetch_favorite_authors_use_case.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AuthorsModule {
  FetchFavoriteAuthorsUseCase getFetchFavoriteAuthorsUseCase(
    final FetchFavoriteAuthorsUseCaseImpl impl,
  ) =>
      impl;

  AuthorRepository getAuthorRepository(
    final AuthorRepositoryImpl repository,
  ) =>
      repository;
}
