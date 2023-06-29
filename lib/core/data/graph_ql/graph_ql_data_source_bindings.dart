import 'package:book_app/core/data/graph_ql/graph_ql_data_source.dart';
import 'package:book_app/core/data/graph_ql/graph_ql_data_source_adapter.dart';
import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';

//TODO Find better way to set baseUrl
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
