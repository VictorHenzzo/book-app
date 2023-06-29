import 'package:bloc_test/bloc_test.dart';
import 'package:book_app/core/domain/entities/author_entity.dart';
import 'package:book_app/core/domain/entities/book_entity.dart';
import 'package:book_app/core/infra/errors/app_error.dart';
import 'package:book_app/modules/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../mocks.dart';

void main() {
  late HomeBloc sut;
  late FetchAllBooksUseCaseMock fetchAllBooksUseCase;
  late FetchFavoriteBooksUseCaseMock fetchFavoriteBooksUseCase;
  late FetchFavoriteAuthorsUseCaseMock fetchFavoriteAuthorsUseCase;
  late FetchUserImageUseCaseMock fetchUserImageUseCase;

  late AppError appError;
  late List<BookEntity> favoriteBooks;
  late List<BookEntity> allBooks;
  late List<AuthorEntity> favoriteAuthors;
  late String userImageUrl;

  setUp(() {
    fetchAllBooksUseCase = FetchAllBooksUseCaseMock();
    fetchFavoriteBooksUseCase = FetchFavoriteBooksUseCaseMock();
    fetchFavoriteAuthorsUseCase = FetchFavoriteAuthorsUseCaseMock();
    fetchUserImageUseCase = FetchUserImageUseCaseMock();

    sut = HomeBloc(
      fetchUserImageUseCase: fetchUserImageUseCase,
      fetchAllBooksUseCase: fetchAllBooksUseCase,
      fetchFavoriteBooksUseCase: fetchFavoriteBooksUseCase,
      fetchFavoriteAuthorsUseCase: fetchFavoriteAuthorsUseCase,
    );

    appError = AppError(
      stackTrace: StackTrace.empty,
      exception: Exception(),
    );

    const book = BookEntity(
      imageUrl: 'imageUrl',
      name: 'name',
      author: 'author',
      id: 'id',
    );

    favoriteBooks = [book];
    allBooks = [book];
    favoriteAuthors = [
      const AuthorEntity(
        name: 'name',
        imageUrl: 'imageUrl',
        booksCount: 0,
        id: 'id',
      ),
    ];
    userImageUrl = 'userImageUrl';
  });

  void mockFetchAllBooksUseCase({
    required final bool success,
  }) {
    final whenCall = when(
      fetchAllBooksUseCase.fetchAllBooks,
    );

    if (success) {
      whenCall.thenAnswer(
        (final _) async => Result.success(allBooks),
      );
    } else {
      whenCall.thenAnswer(
        (final _) async => Result.failure(appError),
      );
    }
  }

  void mockFetchFavoriteBooksUseCase({
    required final bool success,
  }) {
    final whenCall = when(
      fetchFavoriteBooksUseCase.fetchFavoriteBooks,
    );

    if (success) {
      whenCall.thenAnswer(
        (final _) async => Result.success(favoriteBooks),
      );
    } else {
      whenCall.thenAnswer(
        (final _) async => Result.failure(appError),
      );
    }
  }

  void mockFetchFavoriteAuthorsUseCase({
    required final bool success,
  }) {
    final whenCall = when(
      fetchFavoriteAuthorsUseCase.fetchFavoriteAuthors,
    );

    if (success) {
      whenCall.thenAnswer(
        (final _) async => Result.success(favoriteAuthors),
      );
    } else {
      whenCall.thenAnswer(
        (final _) async => Result.failure(appError),
      );
    }
  }

  void mockFetchUserImageUseCase({
    required final bool success,
  }) {
    final whenCall = when(
      fetchUserImageUseCase.fetchUserImage,
    );

    if (success) {
      whenCall.thenAnswer(
        (final _) async => Result.success(userImageUrl),
      );
    } else {
      whenCall.thenAnswer(
        (final _) async => Result.failure(appError),
      );
    }
  }

  blocTest(
    'Should be able to call useCases',
    setUp: () {
      mockFetchAllBooksUseCase(success: true);
      mockFetchFavoriteBooksUseCase(success: true);
      mockFetchFavoriteAuthorsUseCase(success: true);
      mockFetchUserImageUseCase(success: true);
    },
    build: () => sut,
    act: (final bloc) => bloc.add(
      FetchDependenciesEvent(),
    ),
    verify: (final _) {
      verify(fetchAllBooksUseCase.fetchAllBooks).called(1);
      verify(fetchFavoriteBooksUseCase.fetchFavoriteBooks).called(1);
      verify(fetchFavoriteAuthorsUseCase.fetchFavoriteAuthors).called(1);
      verify(fetchUserImageUseCase.fetchUserImage).called(1);
    },
  );

  blocTest(
    'Should emit a loading state initially and then a loaded state if all use cases complete successfully',
    setUp: () {
      mockFetchAllBooksUseCase(success: true);
      mockFetchFavoriteBooksUseCase(success: true);
      mockFetchFavoriteAuthorsUseCase(success: true);
      mockFetchUserImageUseCase(success: true);
    },
    build: () => sut,
    act: (final bloc) => bloc.add(
      FetchDependenciesEvent(),
    ),
    expect: () => <HomeState>[
      const HomeLoadingState(),
      HomeLoadedState(
        userImageUrl: userImageUrl,
        favoriteBooks: favoriteBooks,
        allBooks: allBooks,
        favoriteAuthors: favoriteAuthors,
      ),
    ],
  );

  blocTest(
    'Should emit a loading state initially and then a error state if fetchAllBooksUseCase returns error',
    setUp: () {
      mockFetchAllBooksUseCase(success: false);
      mockFetchFavoriteBooksUseCase(success: true);
      mockFetchFavoriteAuthorsUseCase(success: true);
      mockFetchUserImageUseCase(success: true);
    },
    build: () => sut,
    act: (final bloc) => bloc.add(
      FetchDependenciesEvent(),
    ),
    expect: () => const <HomeState>[
      HomeLoadingState(),
      HomeErrorState(),
    ],
  );

  blocTest(
    'Should emit a loading state initially and then a error state if fetchFavoriteBooksUseCase returns error',
    setUp: () {
      mockFetchAllBooksUseCase(success: true);
      mockFetchFavoriteBooksUseCase(success: false);
      mockFetchFavoriteAuthorsUseCase(success: true);
      mockFetchUserImageUseCase(success: true);
    },
    build: () => sut,
    act: (final bloc) => bloc.add(
      FetchDependenciesEvent(),
    ),
    expect: () => const <HomeState>[
      HomeLoadingState(),
      HomeErrorState(),
    ],
  );

  blocTest(
    'Should emit a loading state initially and then a error state if fetchFavoriteAuthorsUseCase returns error',
    setUp: () {
      mockFetchAllBooksUseCase(success: true);
      mockFetchFavoriteBooksUseCase(success: true);
      mockFetchFavoriteAuthorsUseCase(success: false);
      mockFetchUserImageUseCase(success: true);
    },
    build: () => sut,
    act: (final bloc) => bloc.add(
      FetchDependenciesEvent(),
    ),
    expect: () => const <HomeState>[
      HomeLoadingState(),
      HomeErrorState(),
    ],
  );

  blocTest(
    'Should emit a loading state initially and then a error state if fetchUserImageUseCase returns error',
    setUp: () {
      mockFetchAllBooksUseCase(success: true);
      mockFetchFavoriteBooksUseCase(success: true);
      mockFetchFavoriteAuthorsUseCase(success: true);
      mockFetchUserImageUseCase(success: false);
    },
    build: () => sut,
    act: (final bloc) => bloc.add(
      FetchDependenciesEvent(),
    ),
    expect: () => const <HomeState>[
      HomeLoadingState(),
      HomeErrorState(),
    ],
  );
}
