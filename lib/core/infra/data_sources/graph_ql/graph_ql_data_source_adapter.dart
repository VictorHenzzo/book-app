import 'package:book_app/core/infra/data_sources/graph_ql/graph_ql_data_source.dart';
import 'package:graphql/client.dart' hide Response;

//TODO Mover isso daqui para a pasta data
class GraphQLDataSourceAdapter implements GraphQLDataSource {
  GraphQLDataSourceAdapter({
    required this.client,
  });

  final GraphQLClient client;

  @override
  Future<Response> query({
    required final String queryArguments,
    final Map<String, dynamic>? variables,
  }) async {
    final queryOptions = QueryOptions(
      document: gql(queryArguments),
      variables: variables ?? {},
    );

    final response = await client.query(
      queryOptions,
    );

    final exception = response.exception;

    if (exception != null) {
      throw exception;
    }

    return Response(
      body: response.data ?? {},
    );
  }
}
