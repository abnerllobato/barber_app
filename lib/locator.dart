import 'package:barbearia_app/repositories/auth_repository_firebase.dart';
import 'package:get_it/get_it.dart';

import 'repositories/auth_repository.dart';

final serviceLocator = GetIt.instance;

void setup() {
  serviceLocator.registerSingleton<AuthRepository>(FirebaseAuthRepository());
}
