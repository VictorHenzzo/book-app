import 'package:bloc_test/bloc_test.dart';
import 'package:book_app/core/domain/entities/book_entity.dart';
import 'package:book_app/core/infra/errors/app_error.dart';
import 'package:book_app/modules/book_details/presentation/bloc/book_details_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../mocks.dart';

void main() {
  late BookDetailsBloc sut;
  late FetchBookDescriptionUseCaseMock fetchBookDescriptionUseCase;

  late AppError appError;
  late String bookDescription;
  late BookEntity book;

  setUp(() {
    fetchBookDescriptionUseCase = FetchBookDescriptionUseCaseMock();
    sut = BookDetailsBloc(
      fetchBookDescriptionUseCase: fetchBookDescriptionUseCase,
    );

    appError = AppError(
      stackTrace: StackTrace.empty,
      exception: Exception(),
    );
    bookDescription = 'book description';
    book = const BookEntity(
      imageUrl: 'imageUrl',
      name: 'name',
      author: 'author',
      id: 'id',
    );
  });

  void mockFetchBookDescription({
    required final bool success,
  }) {
    final whenCall = when(
      () => fetchBookDescriptionUseCase.fetchBookDescription(
        any(),
      ),
    );

    if (success) {
      whenCall.thenAnswer(
        (final _) async => Result.success(bookDescription),
      );
    } else {
      whenCall.thenAnswer(
        (final _) async => Result.failure(appError),
      );
    }
  }

  blocTest(
    'Should be able to call FetchBookDescriptionUseCase with the correct values',
    setUp: () {
      mockFetchBookDescription(success: true);
    },
    build: () => sut,
    act: (final bloc) => bloc.add(
      FetchContentEvent(bookEntity: book),
    ),
    verify: (final _) {
      verify(
        () => fetchBookDescriptionUseCase.fetchBookDescription(
          book.id,
        ),
      ).called(1);
    },
  );

  blocTest(
    'Should emit a loading and then a loaded state on success',
    setUp: () {
      mockFetchBookDescription(success: true);
    },
    build: () => sut,
    act: (final bloc) => bloc.add(
      FetchContentEvent(bookEntity: book),
    ),
    expect: () => <BookDetailsState>[
      const BookDetailsLoadingState(),
      BookDetailsLoadedState(
        bookDetails: bookDescription,
      ),
    ],
  );

  blocTest(
    'Should emit a loading and then a error state on failure',
    setUp: () {
      mockFetchBookDescription(success: false);
    },
    build: () => sut,
    act: (final bloc) => bloc.add(
      FetchContentEvent(bookEntity: book),
    ),
    expect: () => const <BookDetailsState>[
      BookDetailsLoadingState(),
      BookDetailsErrorState(),
    ],
  );
}
