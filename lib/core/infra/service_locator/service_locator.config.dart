// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:book_app/core/infra/data_sources/graph_ql/graph_ql_data_source.dart'
    as _i4;
import 'package:book_app/core/infra/data_sources/graph_ql/graph_ql_data_source_bindings.dart'
    as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:graphql/client.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final graphQlDataSourceBindings = _$GraphQlDataSourceBindings();
    gh.factory<_i3.GraphQLClient>(() => graphQlDataSourceBindings.client);
    gh.factory<_i4.GraphQLDataSource>(
        () => graphQlDataSourceBindings.dataSource());
    return this;
  }
}

class _$GraphQlDataSourceBindings extends _i5.GraphQlDataSourceBindings {}
