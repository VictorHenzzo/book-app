import 'package:book_app/core/data/repositories/book_repository_impl.dart';
import 'package:book_app/core/domain/entities/book_entity.dart';
import 'package:book_app/core/infra/data_sources/graph_ql/graph_ql_data_source.dart';
import 'package:book_app/core/infra/errors/app_error.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql/client.dart' hide Response;
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  late BookRepositoryImpl sut;
  late GraphQLDataSourceMock dataSource;
  late String queryArguments;

  setUp(() {
    dataSource = GraphQLDataSourceMock();
    sut = BookRepositoryImpl(dataSource: dataSource);
  });

  group('FetchAllBooks', () {
    group('Success', () {
      setUp(() {
        queryArguments = ''' 
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

        when(
          () => dataSource.query(
            queryArguments: any(named: 'queryArguments'),
          ),
        ).thenAnswer(
          (final _) async => Response(
            body: {
              "allBooks": [
                {
                  "name": "Clean Code: A Handbook of Agile Software Craftsmanship",
                  "id": "1",
                  "cover": "https://sscdn.co/gcs/studiosol/2022/mobile/book/clean-code.jpg",
                  "author": {"name": "Robert Cecil Martin"}
                },
                {
                  "name":
                      "Clean Architecture: A Craftsman's Guide to Software Structure and Design",
                  "id": "2",
                  "cover": "https://sscdn.co/gcs/studiosol/2022/mobile/book/clean-architecture.jpg",
                  "author": {"name": "Robert Cecil Martin"}
                },
                {
                  "name": "The Clean Coder: A Code of Conduct for Professional Programmers",
                  "id": "3",
                  "cover": "https://sscdn.co/gcs/studiosol/2022/mobile/book/the-clean-coder.jpg",
                  "author": {"name": "Robert Cecil Martin"}
                },
              ],
            },
          ),
        );
      });

      test('Should be able to call GraphQLDataSource with the correct values', () async {
        // act
        await sut.fetchAllBooks();

        // assert
        verify(
          () => dataSource.query(
            queryArguments: queryArguments,
          ),
        ).called(1);
      });

      test('Should be able to return a list of book entities', () async {
        // act
        final result = await sut.fetchAllBooks();

        // assert
        expect(
          result.getOrNull(),
          isA<List<BookEntity>>(),
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
        final result = await sut.fetchAllBooks();

        // assert
        expect(
          result.exceptionOrNull(),
          isA<AppError>(),
        );
      });
    });
  });

  group('FetchFavoriteBooks', () {
    group('Success', () {
      setUp(() {
        queryArguments = ''' 
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

        when(
          () => dataSource.query(
            queryArguments: any(named: 'queryArguments'),
          ),
        ).thenAnswer(
          (final _) async => Response(
            body: {
              "favoriteBooks": [
                {
                  "name": "Clean Code: A Handbook of Agile Software Craftsmanship",
                  "id": "1",
                  "cover": "https://sscdn.co/gcs/studiosol/2022/mobile/book/clean-code.jpg",
                  "author": {"name": "Robert Cecil Martin"}
                },
                {
                  "name": "The Clean Coder: A Code of Conduct for Professional Programmers",
                  "id": "3",
                  "cover": "https://sscdn.co/gcs/studiosol/2022/mobile/book/the-clean-coder.jpg",
                  "author": {"name": "Robert Cecil Martin"}
                },
              ],
            },
          ),
        );
      });

      test('Should be able to call GraphQLDataSource with the correct values', () async {
        // act
        await sut.fetchFavoriteBooks();

        // assert
        verify(
          () => dataSource.query(
            queryArguments: queryArguments,
          ),
        ).called(1);
      });

      test('Should be able to return a list of favorite books', () async {
        // act
        final result = await sut.fetchFavoriteBooks();

        // assert
        expect(
          result.getOrNull(),
          isA<List<BookEntity>>(),
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
        final result = await sut.fetchFavoriteBooks();

        // assert
        expect(
          result.exceptionOrNull(),
          isA<AppError>(),
        );
      });
    });
  });
}
