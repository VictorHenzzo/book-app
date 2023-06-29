// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:book_app/core/data/data_sources/graph_ql/graph_ql_data_source.dart'
    as _i4;
import 'package:book_app/core/data/data_sources/graph_ql/graph_ql_data_source_bindings.dart'
    as _i16;
import 'package:book_app/core/data/repositories/author_repository_impl.dart'
    as _i6;
import 'package:book_app/core/data/repositories/book_repository_impl.dart'
    as _i7;
import 'package:book_app/core/data/repositories/user_repository_impl.dart'
    as _i5;
import 'package:book_app/core/domain/repositories/author_repository.dart'
    as _i9;
import 'package:book_app/core/domain/repositories/book_repository.dart' as _i10;
import 'package:book_app/core/domain/repositories/user_repository.dart' as _i8;
import 'package:book_app/core/domain/use_cases/authors/fetch_favorite_authors_use_case.dart'
    as _i13;
import 'package:book_app/core/domain/use_cases/books/fetch_all_books_use_case.dart'
    as _i11;
import 'package:book_app/core/domain/use_cases/books/fetch_book_details_use_case.dart'
    as _i12;
import 'package:book_app/core/domain/use_cases/books/fetch_favorite_books_use_case.dart'
    as _i14;
import 'package:book_app/core/domain/use_cases/user/fetch_user_image_use_case.dart'
    as _i15;
import 'package:book_app/core/infra/service_locator/modules/authors_module.dart'
    as _i17;
import 'package:book_app/core/infra/service_locator/modules/book_module.dart'
    as _i18;
import 'package:book_app/core/infra/service_locator/modules/user_module.dart'
    as _i19;
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
    final bookModule = _$BookModule();
    gh.factory<_i3.GraphQLClient>(() => graphQlDataSourceBindings.client);
    gh.factory<_i4.GraphQLDataSource>(
        () => graphQlDataSourceBindings.dataSource());
    gh.factory<_i5.UserRepositoryImpl>(
        () => _i5.UserRepositoryImpl(dataSource: gh<_i4.GraphQLDataSource>()));
    gh.factory<_i6.AuthorRepositoryImpl>(() =>
        _i6.AuthorRepositoryImpl(dataSource: gh<_i4.GraphQLDataSource>()));
    gh.factory<_i7.BookRepositoryImpl>(
        () => _i7.BookRepositoryImpl(dataSource: gh<_i4.GraphQLDataSource>()));
    gh.factory<_i8.UserRepository>(
        () => userModule.getUserRepository(gh<_i5.UserRepositoryImpl>()));
    gh.factory<_i9.AuthorRepository>(() =>
        authorsModule.getAuthorRepository(gh<_i6.AuthorRepositoryImpl>()));
    gh.factory<_i10.BookRepository>(
        () => bookModule.getAuthorRepository(gh<_i7.BookRepositoryImpl>()));
    gh.factory<_i11.FetchAllBooksUseCaseImpl>(
        () => _i11.FetchAllBooksUseCaseImpl(gh<_i10.BookRepository>()));
    gh.factory<_i12.FetchBookDetailsUseCaseImpl>(
        () => _i12.FetchBookDetailsUseCaseImpl(gh<_i10.BookRepository>()));
    gh.factory<_i13.FetchFavoriteAuthorsUseCaseImpl>(
        () => _i13.FetchFavoriteAuthorsUseCaseImpl(gh<_i9.AuthorRepository>()));
    gh.factory<_i14.FetchFavoriteBooksUseCaseImpl>(
        () => _i14.FetchFavoriteBooksUseCaseImpl(gh<_i10.BookRepository>()));
    gh.factory<_i15.FetchUserImageUseCaseImpl>(
        () => _i15.FetchUserImageUseCaseImpl(gh<_i8.UserRepository>()));
    gh.factory<_i11.FetchAllBooksUseCase>(() => bookModule
        .getFetchAllBooksUseCase(gh<_i11.FetchAllBooksUseCaseImpl>()));
    gh.factory<_i12.FetchBookDetailsUseCase>(() => bookModule
        .getFetchBookDetailsUseCase(gh<_i12.FetchBookDetailsUseCaseImpl>()));
    gh.factory<_i13.FetchFavoriteAuthorsUseCase>(() =>
        authorsModule.getFetchFavoriteAuthorsUseCase(
            gh<_i13.FetchFavoriteAuthorsUseCaseImpl>()));
    gh.factory<_i14.FetchFavoriteBooksUseCase>(() =>
        bookModule.getFetchFavoriteBooksUseCase(
            gh<_i14.FetchFavoriteBooksUseCaseImpl>()));
    gh.factory<_i15.FetchUserImageUseCase>(() => userModule
        .getFetchUserImageUseCase(gh<_i15.FetchUserImageUseCaseImpl>()));
    return this;
  }
}

class _$GraphQlDataSourceBindings extends _i16.GraphQlDataSourceBindings {}

class _$AuthorsModule extends _i17.AuthorsModule {}

class _$BookModule extends _i18.BookModule {}

class _$UserModule extends _i19.UserModule {}
