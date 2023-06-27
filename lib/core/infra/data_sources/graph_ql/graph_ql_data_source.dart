abstract class GraphQLDataSource {
  Future<Response> query({
    required final String queryArguments,
    final Map<String, dynamic>? variables,
  });
}

class Response {
  Response({
    required this.body,
  });

  final Map<String, dynamic>? body;
}
