import 'package:get_it/get_it.dart';
import 'package:maveshi/all_utils.dart';
import 'package:maveshi/utils/repositories/farm_repository.dart';
import 'package:maveshi/utils/repositories/user_repository.dart';

final _locator = GetIt.instance;

Prefs get prefs => _locator<Prefs>();
UserRepository get userRepository => _locator<UserRepository>();
FarmRepository get farmRepository => _locator<FarmRepository>();

abstract class DependencyInjectionEnvironment {
  static Future<void> setup() async {
    _locator.registerLazySingleton<Prefs>(() => Prefs());
    await prefs.init();

    _locator.registerLazySingleton<UserRepository>(() => UserRepository());
    _locator.registerLazySingleton<FarmRepository>(() => FarmRepository());
  }
}
