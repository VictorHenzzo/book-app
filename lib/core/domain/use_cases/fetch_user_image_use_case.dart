import 'package:book_app/core/domain/repositories/user_image_repository.dart';
import 'package:book_app/core/infra/errors/app_error.dart';
import 'package:injectable/injectable.dart';
import 'package:result_dart/result_dart.dart';

abstract class FetchUserImageUseCase {
  Future<Result<String, AppError>> fetchUserImage();
}

@injectable
class FetchUserImageUseCaseImpl implements FetchUserImageUseCase {
  FetchUserImageUseCaseImpl(this.repository);

  final UserImageRepository repository;

  @override
  Future<Result<String, AppError>> fetchUserImage() {
    return repository.fetchUserImage();
  }
}
