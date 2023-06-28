import 'package:book_app/core/data/models/author_model.dart';
import 'package:book_app/core/domain/entities/author_entity.dart';
import 'package:book_app/core/domain/repositories/author_repository.dart';
import 'package:book_app/core/domain/use_cases/authors/fetch_favorite_authors_use_case.dart';
import 'package:book_app/core/infra/data_sources/graph_ql/graph_ql_data_source.dart';
import 'package:book_app/core/infra/errors/app_error.dart';
import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';
import 'package:result_dart/result_dart.dart';

@injectable
class AuthorRepositoryImpl implements AuthorRepository {
  AuthorRepositoryImpl({required this.dataSource});

  final GraphQLDataSource dataSource;

  @override
  FetchFavoriteAuthorsResult fetchFavoriteAuthors() async {
    try {
      const queryArguments = '''
        query FetchFavotireAuthors{
          favoriteAuthors{
            id,
            name,
            booksCount,
            picture,
          }
        }
      ''';

      final response = await dataSource.query(
        queryArguments: queryArguments,
      );

      final favoriteAuthors = _convertResponseToAuthor(
        response.body,
      );

      return Result.success(favoriteAuthors);
    } on OperationException catch (exception, stackTrace) {
      return Result.failure(
        AppError(
          stackTrace: stackTrace,
          exception: exception,
        ),
      );
    }
  }

  List<AuthorEntity> _convertResponseToAuthor(final Map<String, dynamic> map) {
    final rawAuthors = map['favoriteAuthors'] as List<dynamic>;

    return rawAuthors.map(
      (final author) {
        return AuthorModel.fromMap(author).toEntity();
      },
    ).toList(growable: false);
  }
}
