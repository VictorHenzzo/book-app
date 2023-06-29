import 'package:book_app/core/domain/entities/book_details_entity.dart';
import 'package:book_app/core/domain/repositories/book_repository.dart';
import 'package:book_app/core/infra/errors/app_error.dart';
import 'package:injectable/injectable.dart';
import 'package:result_dart/result_dart.dart';

typedef FetchBookDetailsResult = Future<Result<BookDetailsEntity, AppError>>;

abstract class FetchBookDetailsUseCase {
  FetchBookDetailsResult fetchBookDetails(
    final String bookId,
  );
}

@injectable
class FetchBookDetailsUseCaseImpl implements FetchBookDetailsUseCase {
  FetchBookDetailsUseCaseImpl(this.bookRepository);

  final BookRepository bookRepository;

  @override
  FetchBookDetailsResult fetchBookDetails(
    final String bookId,
  ) {
    return bookRepository.fetchBookDetails(
      bookId,
    );
  }
}
