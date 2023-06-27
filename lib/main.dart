import 'package:book_app/core/domain/use_cases/fetch_user_image_use_case.dart';
import 'package:book_app/core/infra/service_locator/service_locator.dart';
import 'package:flutter/material.dart';

void main() async {
  ServiceLocator.init();

  final useCase = ServiceLocator.provide<FetchUserImageUseCase>();

  final result = await useCase.fetchUserImage();

  runApp(Container());
}
