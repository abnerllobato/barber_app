import 'package:barbearia_app/models/user_model.dart';
import 'package:barbearia_app/repositories/auth_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepository implements AuthRepository {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  FirebaseFirestore db = FirebaseFirestore.instance;

  FirebaseAuthRepository({firebase_auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  @override
  Future<UserCredential> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
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
    await saveUserProfileDataOnFirestore(user);
    return user;
  }

  @override
  Future<void> saveUserProfileDataOnFirestore(UserModel user) async {
    final docRef = db
        .collection('users')
        .withConverter(
            fromFirestore: UserModel.fromFirestore,
            toFirestore: (UserModel user, options) => user.toFirestore())
        .doc(user.uid);
    await docRef.set(user);
  }

  @override
  Future<void> forgetPassword(email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> logOut() async {
    await Future.wait([_firebaseAuth.signOut()]);
  }
}
