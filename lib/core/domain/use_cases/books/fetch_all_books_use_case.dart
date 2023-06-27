import 'package:book_app/core/domain/entities/book_entity.dart';
import 'package:book_app/core/domain/repositories/book_repository.dart';
import 'package:book_app/core/infra/errors/app_error.dart';
import 'package:result_dart/result_dart.dart';
import 'package:injectable/injectable.dart';

typedef FetchAllBooksResult = Future<Result<List<BookEntity>, AppError>>;

abstract class FetchAllBooksUseCase {
  FetchAllBooksResult fetchAllBooks();
}

@injectable
class FetchAllBooksUseCaseImpl implements FetchAllBooksUseCase {
  FetchAllBooksUseCaseImpl(this.bookRepository);

  final BookRepository bookRepository;

  @override
  FetchAllBooksResult fetchAllBooks() {
    return bookRepository.fetchAllBooks();
  }
}
