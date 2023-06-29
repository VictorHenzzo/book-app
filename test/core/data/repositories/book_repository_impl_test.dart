import 'package:book_app/core/data/data_sources/graph_ql/graph_ql_data_source.dart';
import 'package:book_app/core/data/repositories/book_repository_impl.dart';
import 'package:book_app/core/domain/entities/book_details_entity.dart';
import 'package:book_app/core/domain/entities/book_entity.dart';
import 'package:book_app/core/infra/errors/app_error.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql/client.dart' hide Response;
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  late BookRepositoryImpl sut;
  late GraphQLDataSourceMock dataSource;
  late String queryArguments;

  late String bookId;

  setUp(() {
    dataSource = GraphQLDataSourceMock();
    sut = BookRepositoryImpl(dataSource: dataSource);

    bookId = 'book-id';
  });

  group('FetchAllBooks', () {
    group('Success', () {
      setUp(() {
        queryArguments =
            '''
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
              'allBooks': [
                {
                  'name': 'Clean Code: A Handbook of Agile Software Craftsmanship',
                  'id': '1',
                  'cover': 'https://sscdn.co/gcs/studiosol/2022/mobile/book/clean-code.jpg',
                  'author': {'name': 'Robert Cecil Martin'}
                },
                {
                  'name':
                      "Clean Architecture: A Craftsman's Guide to Software Structure and Design",
                  'id': '2',
                  'cover': 'https://sscdn.co/gcs/studiosol/2022/mobile/book/clean-architecture.jpg',
                  'author': {'name': 'Robert Cecil Martin'}
                },
                {
                  'name': 'The Clean Coder: A Code of Conduct for Professional Programmers',
                  'id': '3',
                  'cover': 'https://sscdn.co/gcs/studiosol/2022/mobile/book/the-clean-coder.jpg',
                  'author': {'name': 'Robert Cecil Martin'}
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
        queryArguments =
            '''
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
              'favoriteBooks': [
                {
                  'name': 'Clean Code: A Handbook of Agile Software Craftsmanship',
                  'id': '1',
                  'cover': 'https://sscdn.co/gcs/studiosol/2022/mobile/book/clean-code.jpg',
                  'author': {'name': 'Robert Cecil Martin'}
                },
                {
                  'name': 'The Clean Coder: A Code of Conduct for Professional Programmers',
                  'id': '3',
                  'cover': 'https://sscdn.co/gcs/studiosol/2022/mobile/book/the-clean-coder.jpg',
                  'author': {'name': 'Robert Cecil Martin'}
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

  group('FetchBookDetails', () {
    group('Success', () {
      setUp(() {
        queryArguments =
            r'''
        query FetchBookDetails($id: ID!) {
          book(id: $id) {
            description
            isFavorite
          }
        }
      ''';

        when(
          () => dataSource.query(
            queryArguments: any(named: 'queryArguments'),
            variables: any(named: 'variables'),
          ),
        ).thenAnswer(
          (final _) async => Response(
            body: {
              'book': {
                'description':
                    'Practical Software Architecture Solutions from the Legendary Robert C. Martin (“Uncle Bob”)\n\n \n\nBy applying universal rules of software architecture, you can dramatically improve developer productivity throughout the life of any software system. Now, building upon the success of his best-selling books Clean Code and The Clean Coder, legendary software craftsman Robert C. Martin (“Uncle Bob”) reveals those rules and helps you apply them.\n\n \n\nMartin’s Clean Architecture doesn’t merely present options. Drawing on over a half-century of experience in software environments of every imaginable type, Martin tells you what choices to make and why they are critical to your success. As you’ve come to expect from Uncle Bob, this book is packed with direct, no-nonsense solutions for the real challenges you’ll face–the ones that will make or break your projects.\n\nLearn what software architects need to achieve–and core disciplines and practices for achieving it\nMaster essential software design principles for addressing function, component separation, and data management\nSee how programming paradigms impose discipline by restricting what developers can do\nUnderstand what’s critically important and what’s merely a “detail”\nImplement optimal, high-level structures for web, database, thick-client, console, and embedded applications\nDefine appropriate boundaries and layers, and organize components and services\nSee why designs and architectures go wrong, and how to prevent (or fix) these failures\nClean Architecture is essential reading for every current or aspiring software architect, systems analyst, system designer, and software manager–and for every programmer who must execute someone else’s designs.',
                'isFavorite': false
              }
            },
          ),
        );
      });

      test('Should be able to call GraphQLDataSource with the correct values', () async {
        // act
        await sut.fetchBookDetails(
          bookId,
        );

        // assert
        verify(
          () => dataSource.query(
            queryArguments: queryArguments,
            variables: {
              'id': bookId,
            },
          ),
        ).called(1);
      });

      test('Should be able to return a bookDetailsEntity', () async {
        // act
        final result = await sut.fetchBookDetails(
          bookId,
        );

        // assert
        expect(
          result.getOrNull(),
          isA<BookDetailsEntity>(),
        );
      });
    });

    group('Failure', () {
      test('Should be able to return error if GraphQLDataSource throws', () async {
        // arrange
        when(
          () => dataSource.query(
            queryArguments: any(named: 'queryArguments'),
            variables: any(named: 'variables'),
          ),
        ).thenThrow(OperationException());

        // act
        final result = await sut.fetchBookDetails(
          bookId,
        );

        // assert
        expect(
          result.exceptionOrNull(),
          isA<AppError>(),
        );
      });
    });
  });
}
