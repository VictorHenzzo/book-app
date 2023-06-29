import 'package:book_app/core/data/repositories/user_repository_impl.dart';
import 'package:book_app/core/data/graph_ql/graph_ql_data_source.dart';
import 'package:book_app/core/infra/errors/app_error.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql/client.dart' hide Response;
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  late UserRepositoryImpl sut;
  late GraphQLDataSourceMock dataSource;
  late String queryArguments;

  setUp(() {
    dataSource = GraphQLDataSourceMock();
    sut = UserRepositoryImpl(dataSource: dataSource);

    queryArguments = '''
        query FetchUserPicture{
          userPicture
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
            'userPicture': 'https://sscdn.co/gcs/studiosol/2022/mobile/avatar.jpg',
          },
        ),
      );
    });

    test('Should be able to call GraphQLDataSource with the correct values', () async {
      // act
      await sut.fetchUserImage();

      // assert
      verify(
        () => dataSource.query(
          queryArguments: queryArguments,
        ),
      ).called(1);
    });

    test('Should be able to return a user image url on success', () async {
      // act
      final result = await sut.fetchUserImage();

      // assert
      expect(
        result.getOrNull(),
        'https://sscdn.co/gcs/studiosol/2022/mobile/avatar.jpg',
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
      final result = await sut.fetchUserImage();

      // assert
      expect(
        result.exceptionOrNull(),
        isA<AppError>(),
      );
    });
  });
}
