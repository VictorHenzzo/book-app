import 'package:book_app/core/data/repositories/user_repository_impl.dart';
import 'package:book_app/core/domain/repositories/user_repository.dart';
import 'package:book_app/core/domain/use_cases/user/fetch_user_image_use_case.dart';
import 'package:injectable/injectable.dart';

@module
abstract class UserModule {
  FetchUserImageUseCase getFetchUserImageUseCase(
    final FetchUserImageUseCaseImpl impl,
  ) =>
      impl;

  UserRepository getUserRepository(
    final UserRepositoryImpl repository,
  ) =>
      repository;
}
