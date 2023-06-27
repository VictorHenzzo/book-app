import 'package:book_app/core/domain/repositories/user_image_repository.dart';
import 'package:book_app/core/domain/use_cases/fetch_user_image_use_case.dart';
import 'package:book_app/core/infra/errors/app_error.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

void main() {
  late FetchUserImageUseCaseImpl sut;
  late _FethUserRepositoryMock repository;

  late AppError appError;
  late String imageUrl;

  setUp(() {
    repository = _FethUserRepositoryMock();
    sut = FetchUserImageUseCaseImpl(repository);

    appError = AppError(
      stackTrace: StackTrace.empty,
      exception: Exception(),
    );
    imageUrl = 'image-url';
  });

  test('Should be able to call repository', () async {
    // arrange
    when(
      repository.fetchUserImage,
    ).thenAnswer(
      (final _) async => Result.success(imageUrl),
    );

    // act
    await sut.fetchUserImage();

    // assert
    verify(
      repository.fetchUserImage,
    ).called(1);
  });

  test('Should be able to return a user image url on success', () async {
    // arrange
    when(
      repository.fetchUserImage,
    ).thenAnswer(
      (final _) async => Result.success(imageUrl),
    );

    // act
    final result = await sut.fetchUserImage();

    // assert
    expect(result.getOrNull(), imageUrl);
  });

  test('Should be able to return error', () async {
    // arrange
    when(
      repository.fetchUserImage,
    ).thenAnswer(
      (final _) async => Result.failure(appError),
    );

    // act
    final result = await sut.fetchUserImage();

    // assert
    expect(result.exceptionOrNull(), appError);
  });
}

class _FethUserRepositoryMock extends Mock implements UserImageRepository {}
