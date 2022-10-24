import 'package:barbearia_app/models/cadastro_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  FirebaseFirestore db = FirebaseFirestore.instance;

  AuthRepository({firebase_auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  Future<UserCredential> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserModel> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    UserCredential userCredential =
        await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (userCredential.user?.uid == null) {
      throw Exception('User null');
    }
    UserModel user = UserModel.fromSignUpCustumerRequest(
      name,
      email,
      userCredential.user!.uid,
    );

    user.toMap();
    saveProfileData(user);
    return user;
  }

  void saveProfileData(UserModel user) async {
    final docRef = db
        .collection('users')
        .withConverter(
            fromFirestore: UserModel.fromFirestore,
            toFirestore: (UserModel user, options) => user.toMap())
        .doc(user.uid);
    await docRef.set(user);
  }

  forgetPassword(email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> logOut() async {
    await Future.wait([_firebaseAuth.signOut()]);
  }
}
