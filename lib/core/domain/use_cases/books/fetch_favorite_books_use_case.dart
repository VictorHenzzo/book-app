import 'package:book_app/core/domain/entities/book_entity.dart';
import 'package:book_app/core/domain/repositories/book_repository.dart';
import 'package:book_app/core/infra/errors/app_error.dart';
import 'package:result_dart/result_dart.dart';
import 'package:injectable/injectable.dart';

typedef FetchFavoriteBooksResult = Future<Result<List<BookEntity>, AppError>>;

abstract class FetchFavoriteBooksUseCase {
  FetchFavoriteBooksResult fetchFavoriteBooks();
}

@injectable
class FetchFavoriteBooksUseCaseImpl implements FetchFavoriteBooksUseCase {
  FetchFavoriteBooksUseCaseImpl(this.bookRepository);

  final BookRepository bookRepository;

  @override
  FetchFavoriteBooksResult fetchFavoriteBooks() {
    return bookRepository.fetchFavoriteBooks();
  }
}
