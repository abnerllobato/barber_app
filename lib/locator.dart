import 'package:barbearia_app/repositories/auth_repository.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

void setup() {
  serviceLocator.registerSingleton<AuthRepository>(AuthRepository());
}
