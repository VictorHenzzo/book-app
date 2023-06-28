part of 'book_details_bloc.dart';

sealed class BookDetailsState {
  const BookDetailsState();
}

final class BookDetailsInitialState extends BookDetailsState {
  const BookDetailsInitialState();
}

final class BookDetailsLoadingState extends BookDetailsState {
  const BookDetailsLoadingState();
}

final class BookDetailsErrorState extends BookDetailsState {
  const BookDetailsErrorState();
}

final class BookDetailsLoadedState extends BookDetailsState {
  const BookDetailsLoadedState({
    required this.bookDetails,
  });

  final String bookDetails;
}
