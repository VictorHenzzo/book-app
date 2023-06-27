import 'package:book_app/core/domain/use_cases/authors/fetch_favorite_authors_use_case.dart';

abstract class AuthorRepository {
  FetchFavoriteAuthorsResult fetchFavoriteAuthors();
}
