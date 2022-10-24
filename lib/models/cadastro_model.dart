import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? name;
  String? email;
  String? password;
  String? createdAt;
  String? updatedAt;
  UserType? userType;
  String? uid;

  UserModel(
      {this.name,
      this.createdAt,
      this.updatedAt,
      this.email,
      this.userType,
      this.password,
      this.uid});

  factory UserModel.fromJson(dynamic json) {
    return UserModel(
        name: json['name'],
        email: json['email'],
        password: json['password'],
        createdAt: json['dataCriacao'],
        updatedAt: json['dataModificacao'],
        userType: json['nivel']);
  }

  factory UserModel.fromSignUpCustumerRequest(
      String name, String email, String uid) {
    return UserModel(
        name: name,
        email: email,
        createdAt: DateTime.now().toString(),
        updatedAt: DateTime.now().toString(),
        userType: UserType.customer,
        uid: uid);
  }

  //TODO factory from signup informations.

  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserModel(
      name: data?['name'],
      email: data?['email'],
      createdAt: DateTime.now().toString(),
      updatedAt: DateTime.now().toString(),
      userType: UserType.customer,
      uid: data?['uid'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'userType': userType!.name,
    };
  }

  static UserModel fromSnapshot(DocumentSnapshot snap) {
    UserModel cadastro = UserModel(
        name: snap['name'],
        email: snap['email'],
        password: snap['password'],
        createdAt: snap['dataCriacao'],
        updatedAt: snap['dataModificacao'],
        userType: snap['nivel']);
    return cadastro;
  }

  @override
  String toString() {
    return '{ $name, $email, $password,$createdAt,$updatedAt, $userType}';
  }
}

enum UserType {
  customer,
  barber,
  admin,
}
