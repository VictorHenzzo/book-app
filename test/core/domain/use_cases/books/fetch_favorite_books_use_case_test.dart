import 'package:book_app/core/domain/entities/book_entity.dart';
import 'package:book_app/core/domain/repositories/book_repository.dart';
import 'package:book_app/core/domain/use_cases/books/fetch_favorite_books_use_case.dart';
import 'package:book_app/core/infra/errors/app_error.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

void main() {
  late FetchFavoriteBooksUseCaseImpl sut;
  late _BookRepositoryMock repository;

  late AppError appError;
  late List<BookEntity> bookList;
  late BookEntity book;

  setUp(() {
    repository = _BookRepositoryMock();
    sut = FetchFavoriteBooksUseCaseImpl(repository);

    appError = AppError(
      stackTrace: StackTrace.empty,
      exception: Exception(),
    );

    book = const BookEntity(
      imageUrl: 'imageUrl',
      name: 'name',
      author: 'author',
      id: 'id',
    );
    bookList = [book];
  });

  test('Should be able to call repository', () async {
    // arrange
    when(repository.fetchFavoriteBooks).thenAnswer(
      (final _) async => Result.success(bookList),
    );

    // act
    await sut.fetchFavoriteBooks();

    // assert
    verify(
      repository.fetchFavoriteBooks,
    ).called(1);
  });

  test('Should be  able to return a favorite book list on success', () async {
    // arrange
    when(repository.fetchFavoriteBooks).thenAnswer(
      (final _) async => Result.success(bookList),
    );

    // act
    final result = await sut.fetchFavoriteBooks();

    // assert
    expect(result.getOrNull(), bookList);
  });

  test('Should be able to return a AppError on failure', () async {
    // arrange
    when(repository.fetchFavoriteBooks).thenAnswer(
      (final _) async => Result.failure(appError),
    );

    // act
    final result = await sut.fetchFavoriteBooks();

    // assert
    expect(result.exceptionOrNull(), appError);
  });
}

class _BookRepositoryMock extends Mock implements BookRepository {}
