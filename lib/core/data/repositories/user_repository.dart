import 'package:book_app/core/domain/repositories/user_image_repository.dart';
import 'package:book_app/core/infra/data_sources/graph_ql/graph_ql_data_source.dart';
import 'package:book_app/core/infra/errors/app_error.dart';
import 'package:graphql/client.dart';
import 'package:result_dart/result_dart.dart';

class UserRepository implements UserImageRepository {
  UserRepository({required this.dataSource});

  final GraphQLDataSource dataSource;

  @override
  Future<Result<String, AppError>> fetchUserImage() async {
    try {
      const queryArguments = ''' 
        query FetchUserPicture{
          userPicture
        }
      ''';

      final response = await dataSource.query(
        queryArguments: queryArguments,
      );

      final userImage = response.body['data']['userPicture'] as String;
      return Result.success(userImage);
    } on OperationException catch (exception, stackTrace) {
      return Result.failure(
        AppError(
          stackTrace: stackTrace,
          exception: exception,
        ),
      );
    }
  }
}