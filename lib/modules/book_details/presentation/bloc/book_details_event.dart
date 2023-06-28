part of 'book_details_bloc.dart';

sealed class BookDetailsEvent {
  const BookDetailsEvent();
}

final class FetchContentEvent extends BookDetailsEvent {
  FetchContentEvent({
    required this.bookEntity,
  });

  final BookEntity bookEntity;
}
