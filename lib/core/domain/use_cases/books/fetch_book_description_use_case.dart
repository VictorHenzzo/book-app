import 'package:book_app/core/domain/repositories/book_repository.dart';
import 'package:book_app/core/infra/errors/app_error.dart';
import 'package:injectable/injectable.dart';
import 'package:result_dart/result_dart.dart';

typedef FetchBookDescriptionResult = Future<Result<String, AppError>>;

abstract class FetchBookDescriptionUseCase {
  FetchBookDescriptionResult fetchBookDescription(
    final String bookId,
  );
}

//TODO Ajustar para conter o isFavorite
@injectable
class FetchBookDescriptionUseCaseImpl implements FetchBookDescriptionUseCase {
  FetchBookDescriptionUseCaseImpl(this.bookRepository);

  final BookRepository bookRepository;

  @override
  FetchBookDescriptionResult fetchBookDescription(
    final String bookId,
  ) {
    return bookRepository.fetchBookDescription(
      bookId,
    );
  }
}
