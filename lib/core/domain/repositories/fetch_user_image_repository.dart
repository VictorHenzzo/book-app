import 'package:book_app/core/infra/errors/app_error.dart';
import 'package:result_dart/result_dart.dart';

abstract class FetchUserImageRepository {
  Future<Result<String, AppError>> fetchUserImage();
}
