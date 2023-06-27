import 'package:graphql_flutter/graphql_flutter.dart';

abstract class GraphQLDataSource {
  Future<Response> query({
    required final QueryOptions queryOptions,
  });
}

class Response {
  Response({
    required this.body,
  });

  final Map<String, dynamic> body;
}
