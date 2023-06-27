import 'package:book_app/core/domain/entities/author_entity.dart';
import 'package:book_app/core/domain/repositories/author_repository.dart';
import 'package:book_app/core/domain/use_cases/authors/fetch_favorite_authors_use_case.dart';
import 'package:book_app/core/infra/errors/app_error.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

void main() {
  late FetchFavoriteAuthorsUseCaseImpl sut;
  late _AuthorRepositoryMock repository;

  late AppError appError;
  late AuthorEntity author;
  late List<AuthorEntity> authorList;

  setUp(() {
    repository = _AuthorRepositoryMock();
    sut = FetchFavoriteAuthorsUseCaseImpl(repository);

    appError = AppError(
      stackTrace: StackTrace.empty,
      exception: Exception(),
    );

    author = AuthorEntity(
      name: 'name',
      imageUrl: 'imageUrl',
      booksCount: 0,
      id: 'id',
    );
    authorList = [
      author,
    ];
  });

  test('Should be able to call repository', () async {
    // arrange
    when(repository.fetchFavoriteAuthors).thenAnswer(
      (final _) async => Result.success(authorList),
    );

    // act
    await sut.fetchFavoriteAuthors();

    // assert
    verify(
      repository.fetchFavoriteAuthors,
    ).called(1);
  });

  test('Should be  able to return a author list on success', () async {
    // arrange
    when(repository.fetchFavoriteAuthors).thenAnswer(
      (final _) async => Result.success(authorList),
    );

    // act
    final result = await sut.fetchFavoriteAuthors();

    // assert
    expect(result.getOrNull(), authorList);
  });

  test('Should be able to return a AppError on failure', () async {
    // arrange
    when(repository.fetchFavoriteAuthors).thenAnswer(
      (final _) async => Result.failure(appError),
    );

    // act
    final result = await sut.fetchFavoriteAuthors();

    // assert
    expect(result.exceptionOrNull(), appError);
  });
}

class _AuthorRepositoryMock extends Mock implements AuthorRepository {}
