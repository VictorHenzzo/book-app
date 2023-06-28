import 'package:book_app/core/data/models/book_model.dart';
import 'package:book_app/core/domain/entities/book_entity.dart';
import 'package:book_app/core/domain/repositories/book_repository.dart';
import 'package:book_app/core/domain/use_cases/books/fetch_all_books_use_case.dart';
import 'package:book_app/core/domain/use_cases/books/fetch_favorite_books_use_case.dart';
import 'package:book_app/core/infra/data_sources/graph_ql/graph_ql_data_source.dart';
import 'package:book_app/core/infra/errors/app_error.dart';
import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';
import 'package:result_dart/result_dart.dart';

@injectable
class BookRepositoryImpl implements BookRepository {
  BookRepositoryImpl({required this.dataSource});

  final GraphQLDataSource dataSource;

  @override
  FetchAllBooksResult fetchAllBooks() async {
    try {
      const queryArguments = '''
        query FetchAllBooks{
          allBooks{
            name,
            id,
            cover,
            author{
              name,
            }
          }
        }
      ''';

      final response = await dataSource.query(
        queryArguments: queryArguments,
      );

      final favoriteAuthors = _convertResponseToBookList(
        response.body['allBooks'],
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

  @override
  FetchFavoriteBooksResult fetchFavoriteBooks() async {
    try {
      const queryArguments = '''
        query FetchFavoriteBooks{
          favoriteBooks{
            name,
            id,
            cover,
            author{
              name,
            }
          }
        }
      ''';

      final response = await dataSource.query(
        queryArguments: queryArguments,
      );

      final favoriteAuthors = _convertResponseToBookList(
        response.body['favoriteBooks'],
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

  List<BookEntity> _convertResponseToBookList(final List<dynamic> rawBooks) {
    return rawBooks.map(
      (final book) {
        return BookModel.fromMap(book).toEntity();
      },
    ).toList(growable: false);
  }
}
