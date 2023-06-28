import 'package:book_app/core/data/repositories/author_repository_impl.dart';
import 'package:book_app/core/domain/entities/author_entity.dart';
import 'package:book_app/core/infra/data_sources/graph_ql/graph_ql_data_source.dart';
import 'package:book_app/core/infra/errors/app_error.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql/client.dart' hide Response;
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  late AuthorRepositoryImpl sut;
  late GraphQLDataSourceMock dataSource;
  late String queryArguments;

  setUp(() {
    dataSource = GraphQLDataSourceMock();
    sut = AuthorRepositoryImpl(dataSource: dataSource);

    queryArguments = '''
        query FetchFavotireAuthors{
          favoriteAuthors{
            id,
            name,
            booksCount,
            picture,
          }
        }
      ''';

    registerFallbackValue(queryArguments);
  });

  group('Success', () {
    setUp(() {
      when(
        () => dataSource.query(
          queryArguments: any(named: 'queryArguments'),
        ),
      ).thenAnswer(
        (final _) async => Response(
          body: {
            'favoriteAuthors': [
              {
                'name': 'Robert Cecil Martin',
                'id': '1',
                'booksCount': 4,
                'picture': 'https://sscdn.co/gcs/studiosol/2022/mobile/author/uncle-bob.jpg'
              },
              {
                'name': 'J. R. R. Tolkien',
                'id': '4',
                'booksCount': 4,
                'picture': 'https://sscdn.co/gcs/studiosol/2022/mobile/author/j-r-r-tolkien.jpg'
              },
              {
                'name': 'Afonso Padilha',
                'id': '5',
                'booksCount': 1,
                'picture': 'https://sscdn.co/gcs/studiosol/2022/mobile/author/afonso-padilha.jpg'
              }
            ]
          },
        ),
      );
    });

    test('Should be able to call GraphQLDataSource with the correct values', () async {
      // act
      await sut.fetchFavoriteAuthors();

      // assert
      verify(
        () => dataSource.query(
          queryArguments: queryArguments,
        ),
      ).called(1);
    });

    test('Should be able to return a list of favorite authors', () async {
      // act
      final result = await sut.fetchFavoriteAuthors();

      // assert
      expect(
        result.getOrNull(),
        isA<List<AuthorEntity>>(),
      );
    });
  });

  group('Failure', () {
    test('Should be able to return error if GraphQLDataSource throws', () async {
      // arrange
      when(
        () => dataSource.query(
          queryArguments: any(named: 'queryArguments'),
        ),
      ).thenThrow(OperationException());

      // act
      final result = await sut.fetchFavoriteAuthors();

      // assert
      expect(
        result.exceptionOrNull(),
        isA<AppError>(),
      );
    });
  });
}
