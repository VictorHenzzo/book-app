import 'package:book_app/core/infra/service_locator/service_locator.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit()
void _configureDependencies(final GetIt getIt) => getIt.init();

class ServiceLocator {
  ServiceLocator._();

  static final GetIt _getIt = GetIt.instance;

  static T provide<T extends Object>() {
    return _getIt.get<T>();
  }

  static void init() {
    _configureDependencies(_getIt);
  }
}
