import 'package:get_it/get_it.dart';
import 'package:maveshi/all_utils.dart';
import 'package:maveshi/utils/repositories/user/user_repository.dart';

final _locator = GetIt.instance;

Prefs get prefs => _locator<Prefs>();
UserRepository get userRepository => _locator<UserRepository>();

abstract class DependencyInjectionEnvironment {
  static Future<void> setup() async {
    _locator.registerLazySingleton<Prefs>(() => Prefs());
    await prefs.init();

    _locator.registerLazySingleton<UserRepository>(() => UserRepository());
  }
}
