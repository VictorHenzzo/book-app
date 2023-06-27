// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:book_app/core/data/repositories/author_repository_impl.dart'
    as _i6;
import 'package:book_app/core/data/repositories/user_repository_impl.dart'
    as _i5;
import 'package:book_app/core/domain/repositories/author_repository.dart'
    as _i8;
import 'package:book_app/core/domain/repositories/user_repository.dart' as _i7;
import 'package:book_app/core/domain/use_cases/authors/fetch_favorite_authors_use_case.dart'
    as _i9;
import 'package:book_app/core/domain/use_cases/user/fetch_user_image_use_case.dart'
    as _i10;
import 'package:book_app/core/infra/data_sources/graph_ql/graph_ql_data_source.dart'
    as _i4;
import 'package:book_app/core/infra/data_sources/graph_ql/graph_ql_data_source_bindings.dart'
    as _i11;
import 'package:book_app/core/infra/service_locator/modules/authors_module.dart'
    as _i13;
import 'package:book_app/core/infra/service_locator/modules/user_module.dart'
    as _i12;
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
    final userModule = _$UserModule();
    final authorsModule = _$AuthorsModule();
    gh.factory<_i3.GraphQLClient>(() => graphQlDataSourceBindings.client);
    gh.factory<_i4.GraphQLDataSource>(
        () => graphQlDataSourceBindings.dataSource());
    gh.factory<_i5.UserRepositoryImpl>(
        () => _i5.UserRepositoryImpl(dataSource: gh<_i4.GraphQLDataSource>()));
    gh.factory<_i6.AuthorRepositoryImpl>(() =>
        _i6.AuthorRepositoryImpl(dataSource: gh<_i4.GraphQLDataSource>()));
    gh.factory<_i7.UserRepository>(
        () => userModule.getUserRepository(gh<_i5.UserRepositoryImpl>()));
    gh.factory<_i8.AuthorRepository>(() =>
        authorsModule.getAuthorRepository(gh<_i6.AuthorRepositoryImpl>()));
    gh.factory<_i9.FetchFavoriteAuthorsUseCaseImpl>(
        () => _i9.FetchFavoriteAuthorsUseCaseImpl(gh<_i8.AuthorRepository>()));
    gh.factory<_i10.FetchUserImageUseCaseImpl>(
        () => _i10.FetchUserImageUseCaseImpl(gh<_i7.UserRepository>()));
    gh.factory<_i9.FetchFavoriteAuthorsUseCase>(() =>
        authorsModule.getFetchFavoriteAuthorsUseCase(
            gh<_i9.FetchFavoriteAuthorsUseCaseImpl>()));
    gh.factory<_i10.FetchUserImageUseCase>(() => userModule
        .getFetchUserImageUseCase(gh<_i10.FetchUserImageUseCaseImpl>()));
    return this;
  }
}

class _$GraphQlDataSourceBindings extends _i11.GraphQlDataSourceBindings {}

class _$UserModule extends _i12.UserModule {}

class _$AuthorsModule extends _i13.AuthorsModule {}
