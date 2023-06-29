import 'package:book_app/core/data/data_sources/graph_ql/graph_ql_data_source.dart';
import 'package:book_app/core/domain/use_cases/authors/fetch_favorite_authors_use_case.dart';
import 'package:book_app/core/domain/use_cases/books/fetch_all_books_use_case.dart';
import 'package:book_app/core/domain/use_cases/books/fetch_book_description_use_case.dart';
import 'package:book_app/core/domain/use_cases/books/fetch_favorite_books_use_case.dart';
import 'package:book_app/core/domain/use_cases/user/fetch_user_image_use_case.dart';
import 'package:mocktail/mocktail.dart';

class GraphQLDataSourceMock extends Mock implements GraphQLDataSource {}

class FetchBookDescriptionUseCaseMock extends Mock implements FetchBookDescriptionUseCase {}

class FetchAllBooksUseCaseMock extends Mock implements FetchAllBooksUseCase {}

class FetchFavoriteBooksUseCaseMock extends Mock implements FetchFavoriteBooksUseCase {}

class FetchFavoriteAuthorsUseCaseMock extends Mock implements FetchFavoriteAuthorsUseCase {}

class FetchUserImageUseCaseMock extends Mock implements FetchUserImageUseCase {}
