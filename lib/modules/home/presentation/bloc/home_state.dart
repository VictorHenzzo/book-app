part of 'home_bloc.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitialState extends HomeState {
  const HomeInitialState();
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState();
}

class HomeErrorState extends HomeState {
  const HomeErrorState();
}

class HomeLoadedState extends HomeState {
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
