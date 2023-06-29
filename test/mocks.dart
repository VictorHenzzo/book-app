import 'package:book_app/core/data/data_sources/graph_ql/graph_ql_data_source.dart';
import 'package:book_app/core/domain/use_cases/books/fetch_book_description_use_case.dart';
import 'package:mocktail/mocktail.dart';

class GraphQLDataSourceMock extends Mock implements GraphQLDataSource {}

class FetchBookDescriptionUseCaseMock extends Mock implements FetchBookDescriptionUseCase {}
