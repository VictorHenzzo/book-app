import 'package:book_app/core/domain/use_cases/books/fetch_all_books_use_case.dart';
import 'package:book_app/core/domain/use_cases/books/fetch_book_details_use_case.dart';
import 'package:book_app/core/domain/use_cases/books/fetch_favorite_books_use_case.dart';

abstract class BookRepository {
  FetchFavoriteBooksResult fetchFavoriteBooks();

  FetchAllBooksResult fetchAllBooks();

  FetchBookDetailsResult fetchBookDetails(final String bookId);
}
