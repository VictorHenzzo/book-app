import 'package:book_app/core/domain/entities/author_entity.dart';
import 'package:book_app/core/domain/repositories/author_repository.dart';
import 'package:book_app/core/infra/errors/app_error.dart';
import 'package:result_dart/result_dart.dart';

typedef FetchFavoriteAuthorsResult = Future<Result<List<AuthorEntity>, AppError>>;

abstract class FetchFavoriteAuthorsUseCase {
  FetchFavoriteAuthorsResult fetchFavoriteAuthors();
}

class FetchFavoriteAuthorsUseCaseImpl implements FetchFavoriteAuthorsUseCase {
  FetchFavoriteAuthorsUseCaseImpl(this.authorRepository);

  final AuthorRepository authorRepository;

  @override
  FetchFavoriteAuthorsResult fetchFavoriteAuthors() {
    return authorRepository.fetchFavoriteAuthors();
  }
}
