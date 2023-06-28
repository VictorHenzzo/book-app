import 'package:book_app/core/domain/repositories/book_repository.dart';
import 'package:book_app/core/domain/use_cases/books/fetch_book_description_use_case.dart';
import 'package:book_app/core/infra/errors/app_error.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

void main() {
  late FetchBookDescriptionUseCaseImpl sut;
  late _BookRepositoryMock repository;

  late AppError appError;
  late String bookId;
  late String bookDescription;

  setUp(() {
    repository = _BookRepositoryMock();
    sut = FetchBookDescriptionUseCaseImpl(repository);

    appError = AppError(
      stackTrace: StackTrace.empty,
      exception: Exception(),
    );

    bookId = 'book-id';
    bookDescription =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut id turpis eu sem venenatis volutpat vitae quis lorem. Nunc cursus orci sit amet tincidunt tempor. Nulla quis erat quis velit scelerisque vulputate. Proin rhoncus mattis nisi euismod vehicula. Donec bibendum, erat facilisis maximus sagittis, nunc neque imperdiet justo, id dapibus ipsum orci vel odio. Vestibulum eleifend mi at tortor congue consequat. Maecenas nec arcu quis magna lacinia varius non at nisi. Maecenas ac ultrices lorem. Maecenas cursus urna nec augue porta venenatis. Phasellus porta ipsum orci, vel consequat dolor commodo a. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tempus ullamcorper massa at iaculis. Donec convallis et dui ac varius. Praesent in ornare sapien, nec faucibus lorem.';
  });

  test('Should be able to call repository with the correct value', () async {
    // arrange
    when(
      () => repository.fetchBookDescription(any()),
    ).thenAnswer(
      (final _) async => Result.success(
        bookDescription,
      ),
    );

    // act
    await sut.fetchBookDescription(
      bookId,
    );

    // assert
    verify(
      () => repository.fetchBookDescription(bookId),
    ).called(1);
  });

  test('Should be able to return a book list on success', () async {
    // arrange
    when(
      () => repository.fetchBookDescription(any()),
    ).thenAnswer(
      (final _) async => Result.success(bookDescription),
    );

    // act
    final result = await sut.fetchBookDescription(
      bookId,
    );

    // assert
    expect(result.getOrNull(), bookDescription);
  });

  test('Should be able to return a AppError on failure', () async {
    // arrange
    when(
      () => repository.fetchBookDescription(any()),
    ).thenAnswer(
      (final _) async => Result.failure(appError),
    );

    // act
    final result = await sut.fetchBookDescription(
      bookId,
    );

    // assert
    expect(result.exceptionOrNull(), appError);
  });
}

class _BookRepositoryMock extends Mock implements BookRepository {}
