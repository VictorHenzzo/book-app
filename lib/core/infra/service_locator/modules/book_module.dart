import 'package:book_app/core/data/repositories/book_repository_impl.dart';
import 'package:book_app/core/domain/repositories/book_repository.dart';
import 'package:book_app/core/domain/use_cases/books/fetch_all_books_use_case.dart';
import 'package:book_app/core/domain/use_cases/books/fetch_book_details_use_case.dart';
import 'package:book_app/core/domain/use_cases/books/fetch_favorite_books_use_case.dart';
import 'package:injectable/injectable.dart';

@module
abstract class BookModule {
  BookRepository getAuthorRepository(
    final BookRepositoryImpl repository,
  ) =>
      repository;

  FetchAllBooksUseCase getFetchAllBooksUseCase(
    final FetchAllBooksUseCaseImpl impl,
  ) =>
      impl;

  FetchFavoriteBooksUseCase getFetchFavoriteBooksUseCase(
    final FetchFavoriteBooksUseCaseImpl impl,
  ) =>
      impl;

  FetchBookDetailsUseCase getFetchBookDetailsUseCase(
    final FetchBookDetailsUseCaseImpl impl,
  ) =>
      impl;
}
