import 'package:book_app/core/domain/entities/book_details_entity.dart';
import 'package:book_app/core/domain/repositories/book_repository.dart';
import 'package:book_app/core/domain/use_cases/books/fetch_book_details_use_case.dart';
import 'package:book_app/core/infra/errors/app_error.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

void main() {
  late FetchBookDetailsUseCaseImpl sut;
  late _BookRepositoryMock repository;

  late AppError appError;
  late String bookId;
  late BookDetailsEntity bookDetails;

  setUp(() {
    repository = _BookRepositoryMock();
    sut = FetchBookDetailsUseCaseImpl(repository);

    appError = AppError(
      stackTrace: StackTrace.empty,
      exception: Exception(),
    );

    bookId = 'book-id';
    bookDetails = const BookDetailsEntity(
      description: 'description',
      isFavorite: true,
    );
  });

  test('Should be able to call repository with the correct value', () async {
    // arrange
    when(
      () => repository.fetchBookDetails(any()),
    ).thenAnswer(
      (final _) async => Result.success(
        bookDetails,
      ),
    );

    // act
    await sut.fetchBookDetails(
      bookId,
    );

    // assert
    verify(
      () => repository.fetchBookDetails(bookId),
    ).called(1);
  });

  test('Should be able to return a BookDetailsEntity on success', () async {
    // arrange
    when(
      () => repository.fetchBookDetails(any()),
    ).thenAnswer(
      (final _) async => Result.success(bookDetails),
    );

    // act
    final result = await sut.fetchBookDetails(
      bookId,
    );

    // assert
    expect(result.getOrNull(), bookDetails);
  });

  test('Should be able to return a AppError on failure', () async {
    // arrange
    when(
      () => repository.fetchBookDetails(any()),
    ).thenAnswer(
      (final _) async => Result.failure(appError),
    );

    // act
    final result = await sut.fetchBookDetails(
      bookId,
    );

    // assert
    expect(result.exceptionOrNull(), appError);
  });
}

class _BookRepositoryMock extends Mock implements BookRepository {}
