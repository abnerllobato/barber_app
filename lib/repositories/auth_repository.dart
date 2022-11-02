import 'package:barbearia_app/models/user_model.dart';

abstract class AuthRepository {
  Future<dynamic> logInWithEmailAndPassword(
      {required String email, required String password});

  Future<UserModel> signup(
      {required String email, required String password, required String name});

  Future<void> saveUserProfileDataOnFirestore(UserModel user);

  Future<void> forgetPassword(String email);

  Future<void> logOut();
}
