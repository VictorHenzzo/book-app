import 'package:book_app/core/infra/data_sources/graph_ql/graph_ql_data_source.dart';
import 'package:graphql_flutter/graphql_flutter.dart' hide Response;

class GraphQLDataSourceAdapter implements GraphQLDataSource {
  GraphQLDataSourceAdapter({
    required this.client,
  });

  final GraphQLClient client;

  @override
  Future<Response> query({
    required final QueryOptions queryOptions,
  }) async {
    final response = await client.query(
      queryOptions,
    );

    if (response.exception != null) {
      throw response.exception!;
    }

    return Response(
      body: response.data ?? {},
    );
  }
}
