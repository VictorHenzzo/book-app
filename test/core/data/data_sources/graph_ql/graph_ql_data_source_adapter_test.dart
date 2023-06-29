import 'package:book_app/core/data/data_sources/graph_ql/graph_ql_data_source_adapter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql/client.dart';

import 'package:mocktail/mocktail.dart';

void main() {
  late GraphQLDataSourceAdapter sut;
  late _GraphQLClientMock client;

  late String queryArguments;
  late Map<String, dynamic> variables;
  late QueryOptions options;
  late Map<String, dynamic> responseData;

  setUp(() {
    client = _GraphQLClientMock();
    sut = GraphQLDataSourceAdapter(
      client: client,
    );

    queryArguments = r'''
      query ReadRepositories($nRepositories: Int!) {
        viewer {
          repositories(last: $nRepositories) {
            nodes {
              __typename
              id
              name
              viewerHasStarred
            }
          }
        }
      }
    ''';

    variables = {
      'some-value': 34,
    };

    responseData = {
      'hello': 'world',
    };

    options = QueryOptions(
      document: gql(queryArguments),
      variables: variables,
    );

    registerFallbackValue(options);
  });

  void mockClientResponse({
    required final bool success,
  }) {
    final whenCall = when(
      () => client.query(any()),
    );

    if (success) {
      whenCall.thenAnswer(
        (final _) async => QueryResult(
          options: options,
          source: QueryResultSource.network,
          data: responseData,
        ),
      );
    } else {
      whenCall.thenAnswer(
        (final _) async => QueryResult(
          options: options,
          source: QueryResultSource.network,
          exception: OperationException(),
        ),
      );
    }
  }

  test('Should be able to call client with the correct values', () async {
    // arrange
    mockClientResponse(success: true);

    // act
    await sut.query(
      queryArguments: queryArguments,
      variables: variables,
    );

    // assert
    verify(
      () => client.query(options),
    ).called(1);
  });

  test('Should be able to return data on success', () async {
    // arrange
    mockClientResponse(success: true);

    // act
    final result = await sut.query(
      queryArguments: queryArguments,
    );

    // assert
    expect(result.body, responseData);
  });

  test('Should be able to throw if client returns error', () async {
    // arrange
    mockClientResponse(success: false);

    // act
    final future = sut.query(
      queryArguments: queryArguments,
    );

    // assert
    expect(
      future,
      throwsA(isA<OperationException>()),
    );
  });
}

class _GraphQLClientMock extends Mock implements GraphQLClient {}
