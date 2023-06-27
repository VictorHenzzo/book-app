// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:book_app/core/data/repositories/user_repository.dart' as _i6;
import 'package:book_app/core/domain/repositories/user_image_repository.dart'
    as _i5;
import 'package:book_app/core/domain/use_cases/fetch_user_image_use_case.dart'
    as _i7;
import 'package:book_app/core/infra/data_sources/graph_ql/graph_ql_data_source.dart'
    as _i4;
import 'package:book_app/core/infra/data_sources/graph_ql/graph_ql_data_source_bindings.dart'
    as _i8;
import 'package:book_app/core/infra/service_locator/modules/user_module.dart'
    as _i9;
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
    final module = _$Module();
    gh.factory<_i3.GraphQLClient>(() => graphQlDataSourceBindings.client);
    gh.factory<_i4.GraphQLDataSource>(
        () => graphQlDataSourceBindings.dataSource());
    gh.factory<_i5.UserImageRepository>(
        () => module.getUserImageRepository(gh<_i6.UserRepository>()));
    gh.factory<_i7.FetchUserImageUseCaseImpl>(
        () => _i7.FetchUserImageUseCaseImpl(gh<_i5.UserImageRepository>()));
    gh.factory<_i7.FetchUserImageUseCase>(() =>
        module.getFetchUserImageUseCase(gh<_i7.FetchUserImageUseCaseImpl>()));
    return this;
  }
}

class _$GraphQlDataSourceBindings extends _i8.GraphQlDataSourceBindings {}

class _$Module extends _i9.Module {}
