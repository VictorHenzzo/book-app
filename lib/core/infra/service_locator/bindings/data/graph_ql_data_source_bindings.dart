import 'package:book_app/core/data/data_sources/graph_ql/graph_ql_data_source.dart';
import 'package:book_app/core/data/data_sources/graph_ql/graph_ql_data_source_adapter.dart';
import 'package:book_app/core/infra/environment/environment_config.dart';
import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';

@module
abstract class GraphQlDataSourceBindings {
  GraphQLClient get client => GraphQLClient(
        link: HttpLink(EnvironmentConfig.baseUrl),
        cache: GraphQLCache(),
      );

  GraphQLDataSource dataSource() => GraphQLDataSourceAdapter(
        client: client,
      );
}
