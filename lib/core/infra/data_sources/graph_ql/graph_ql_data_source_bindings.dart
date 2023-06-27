import 'package:book_app/core/infra/data_sources/graph_ql/graph_ql_data_source.dart';
import 'package:book_app/core/infra/data_sources/graph_ql/graph_ql_data_source_adapter.dart';
import 'package:injectable/injectable.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

@module
abstract class GraphQlDataSourceBindings {
  GraphQLClient get client => GraphQLClient(
        link: HttpLink(
          'https://us-central1-ss-devops.cloudfunctions.net/GraphQL',
        ),
        cache: GraphQLCache(),
      );

  GraphQLDataSource dataSource() => GraphQLDataSourceAdapter(
        client: client,
      );
}
