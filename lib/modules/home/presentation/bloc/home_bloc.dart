import 'package:book_app/core/domain/entities/author_entity.dart';
import 'package:book_app/core/domain/entities/book_entity.dart';
import 'package:book_app/core/domain/use_cases/authors/fetch_favorite_authors_use_case.dart';
import 'package:book_app/core/domain/use_cases/books/fetch_all_books_use_case.dart';
import 'package:book_app/core/domain/use_cases/books/fetch_favorite_books_use_case.dart';
import 'package:book_app/core/domain/use_cases/user/fetch_user_image_use_case.dart';
import 'package:book_app/modules/home/presentation/home_presenter.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> implements HomePresenter {
  HomeBloc({
    required this.fetchUserImageUseCase,
    required this.fetchAllBooksUseCase,
    required this.fetchFavoriteBooksUseCase,
    required this.fetchFavoriteAuthorsUseCase,
  }) : super(const HomeInitialState()) {
    on<FetchDependenciesEvent>(_onFetchDependenciesEvent);
  }

  Future<void> _onFetchDependenciesEvent(
    final FetchDependenciesEvent event,
    final Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoadingState());

    final results = await Future.wait([
      fetchAllBooksUseCase.fetchAllBooks(),
      fetchFavoriteBooksUseCase.fetchFavoriteBooks(),
      fetchFavoriteAuthorsUseCase.fetchFavoriteAuthors(),
      fetchUserImageUseCase.fetchUserImage(),
    ]);

    final allBooks = (results[0].getOrNull()) as List<BookEntity>?;
    final favoriteBooks = (results[1].getOrNull()) as List<BookEntity>?;
    final favoriteAuthors = (results[2].getOrNull()) as List<AuthorEntity>?;
    final userImageUrl = (results[3].getOrNull()) as String?;

    if (allBooks == null ||
        favoriteBooks == null ||
        favoriteAuthors == null ||
        userImageUrl == null) {
      return emit(const HomeErrorState());
    }

    return emit(
      HomeLoadedState(
        userImageUrl: userImageUrl,
        favoriteBooks: favoriteBooks,
        allBooks: allBooks,
        favoriteAuthors: favoriteAuthors,
      ),
    );
  }

  final FetchAllBooksUseCase fetchAllBooksUseCase;
  final FetchFavoriteBooksUseCase fetchFavoriteBooksUseCase;
  final FetchFavoriteAuthorsUseCase fetchFavoriteAuthorsUseCase;
  final FetchUserImageUseCase fetchUserImageUseCase;

  @override
  void addEvent(final HomeEvent event) {
    add(event);
  }
}
