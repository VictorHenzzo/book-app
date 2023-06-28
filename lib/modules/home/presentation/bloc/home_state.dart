part of 'home_bloc.dart';

sealed class HomeState {
  const HomeState();
}

final class HomeInitialState extends HomeState {
  const HomeInitialState();
}

final class HomeLoadingState extends HomeState {
  const HomeLoadingState();
}

final class HomeErrorState extends HomeState {
  const HomeErrorState();
}

final class HomeLoadedState extends HomeState {
  const HomeLoadedState({
    required this.userImageUrl,
    required this.favoriteBooks,
    required this.allBooks,
    required this.favoriteAuthors,
  });

  final String userImageUrl;
  final List<BookEntity> favoriteBooks;
  final List<BookEntity> allBooks;
  final List<AuthorEntity> favoriteAuthors;
}
