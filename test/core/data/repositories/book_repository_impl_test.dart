import 'package:book_app/core/data/repositories/book_repository_impl.dart';
import 'package:book_app/core/domain/entities/book_entity.dart';
import 'package:book_app/core/data/graph_ql/graph_ql_data_source.dart';
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

  group('FetchBookDescription', () {
    group('Success', () {
      setUp(() {
        queryArguments =
            r'''
        query FetchBookDescription($id: ID!) {
          book(id: $id) {
            description
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
                    'Even bad code can function. But if code isn’t clean, it can bring a development organization to its knees. Every year, countless hours and significant resources are lost because of poorly written code. But it doesn’t have to be that way.\n\nNoted software expert Robert C. Martin presents a revolutionary paradigm with Clean Code: A Handbook of Agile Software Craftsmanship. Martin has teamed up with his colleagues from Object Mentor to distill their best agile practice of cleaning code “on the fly” into a book that will instill within you the values of a software craftsman and make you a better programmer–but only if you work at it.\n\nWhat kind of work will you be doing? You’ll be reading code–lots of code. And you will be challenged to think about what’s right about that code, and what’s wrong with it. More importantly, you will be challenged to reassess your professional values and your commitment to your craft.\n\nClean Code is divided into three parts. The first describes the principles, patterns, and practices of writing clean code. The second part consists of several case studies of increasing complexity. Each case study is an exercise in cleaning up code–of transforming a code base that has some problems into one that is sound and efficient. The third part is the payoff: a single chapter containing a list of heuristics and “smells” gathered while creating the case studies. The result is a knowledge base that describes the way we think when we write, read, and clean code.\n\nReaders will come away from this book understanding\nHow to tell the difference between good and bad code\nHow to write good code and how to transform bad code into good code\nHow to create good names, good functions, good objects, and good classes\nHow to format code for maximum readability\nHow to implement complete error handling without obscuring code logic\nHow to unit test and practice test-driven development\nThis book is a must for any developer, software engineer, project manager, team lead, or systems analyst with an interest in producing better code.'
              }
            },
          ),
        );
      });

      test('Should be able to call GraphQLDataSource with the correct values', () async {
        // act
        await sut.fetchBookDescription(
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

      test('Should be able to return a description', () async {
        // act
        final result = await sut.fetchBookDescription(
          bookId,
        );

        // assert
        expect(
          result.getOrNull(),
          isA<String>(),
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
        final result = await sut.fetchBookDescription(
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
