import 'package:book_app/core/domain/repositories/author_repository.dart';
import 'package:book_app/core/domain/use_cases/authors/fetch_favorite_authors_use_case.dart';
import 'package:book_app/core/infra/data_sources/graph_ql/graph_ql_data_source.dart';

class AuthorRepositoryImpl implements AuthorRepository {
  AuthorRepositoryImpl({required this.dataSource});

  final GraphQLDataSource dataSource;

  @override
  FetchFavoriteAuthorsResult fetchFavoriteAuthors() {
    // TODO: implement fetchFavoriteAuthors
    throw UnimplementedError();
  }
}
