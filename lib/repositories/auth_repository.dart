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

  signup({
    required String email,
    required String password,
    required String name,
    String? dataCriacao,
    String? dataModificacao,
    String? nivel,
    UserCredential? uid,
  }) async {
    await _firebaseAuth
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((uuid) async {
      saveProfileData(
        email,
        name,
        dataCriacao,
        dataModificacao,
        nivel,
        password,
      );
      await logInWithEmailAndPassword(email: email, password: password);
    });
  }

  void saveProfileData(
    email,
    name,
    dataCriacao,
    dataModificacao,
    nivel,
    password,
  ) async {
    User? userid = _firebaseAuth.currentUser;
    Cadastro cadastroUser = Cadastro();

    cadastroUser.email = email;
    cadastroUser.name = name;
    cadastroUser.dataCriacao = dataCriacao;
    cadastroUser.dataModificacao = dataModificacao;
    cadastroUser.nivel = nivel;
    cadastroUser.password = password;
    cadastroUser.uid = userid!.uid;

    final docRef = db
        .collection('users')
        .withConverter(
            fromFirestore: Cadastro.fromFirestore,
            toFirestore: (Cadastro user, options) => user.toMap())
        .doc(cadastroUser.uid);
    await docRef.set(cadastroUser);
  }

  forgetPassword(email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> logOut() async {
    await Future.wait([_firebaseAuth.signOut()]);
  }
}
