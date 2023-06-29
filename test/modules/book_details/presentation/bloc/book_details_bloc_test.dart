import 'package:bloc_test/bloc_test.dart';
import 'package:book_app/core/domain/entities/book_details_entity.dart';
import 'package:book_app/core/domain/entities/book_entity.dart';
import 'package:book_app/core/infra/errors/app_error.dart';
import 'package:book_app/modules/book_details/presentation/bloc/book_details_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../mocks.dart';

void main() {
  late BookDetailsBloc sut;
  late FetchBookDetailsUseCaseMock fetchBookDetailsUseCase;

  late AppError appError;
  late BookDetailsEntity bookDetails;
  late BookEntity book;

  setUp(() {
    fetchBookDetailsUseCase = FetchBookDetailsUseCaseMock();
    sut = BookDetailsBloc(
      fetchBookDetailsUseCase: fetchBookDetailsUseCase,
    );

    appError = AppError(
      stackTrace: StackTrace.empty,
      exception: Exception(),
    );
    bookDetails = const BookDetailsEntity(
      description: 'book description',
      isFavorite: true,
    );
    book = const BookEntity(
      imageUrl: 'imageUrl',
      name: 'name',
      author: 'author',
      id: 'id',
    );
  });

  void mockFetchBookDetailsUseCase({
    required final bool success,
  }) {
    final whenCall = when(
      () => fetchBookDetailsUseCase.fetchBookDetails(
        any(),
      ),
    );

    if (success) {
      whenCall.thenAnswer(
        (final _) async => Result.success(bookDetails),
      );
    } else {
      whenCall.thenAnswer(
        (final _) async => Result.failure(appError),
      );
    }
  }

  blocTest(
    'Should be able to call FetchBookDetailsUseCase with the correct values',
    setUp: () {
      mockFetchBookDetailsUseCase(success: true);
    },
    build: () => sut,
    act: (final bloc) => bloc.add(
      FetchContentEvent(bookEntity: book),
    ),
    verify: (final _) {
      verify(
        () => fetchBookDetailsUseCase.fetchBookDetails(
          book.id,
        ),
      ).called(1);
    },
  );

  blocTest(
    'Should emit a loading and then a loaded state on success',
    setUp: () {
      mockFetchBookDetailsUseCase(success: true);
    },
    build: () => sut,
    act: (final bloc) => bloc.add(
      FetchContentEvent(bookEntity: book),
    ),
    expect: () => <BookDetailsState>[
      const BookDetailsLoadingState(),
      BookDetailsLoadedState(
        bookDetails: bookDetails,
      ),
    ],
  );

  blocTest(
    'Should emit a loading and then a error state on failure',
    setUp: () {
      mockFetchBookDetailsUseCase(success: false);
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
