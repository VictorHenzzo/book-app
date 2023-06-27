import 'package:book_app/core/data/repositories/user_repository.dart';
import 'package:book_app/core/domain/repositories/user_image_repository.dart';
import 'package:book_app/core/domain/use_cases/fetch_user_image_use_case.dart';
import 'package:injectable/injectable.dart';

@module
abstract class Module {
  FetchUserImageUseCase getFetchUserImageUseCase(
    final FetchUserImageUseCaseImpl impl,
  ) =>
      impl;

  UserImageRepository getUserImageRepository(
    final UserRepository repository,
  ) =>
      repository;
}
