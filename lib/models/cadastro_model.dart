import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String email;
  String? createdAt;
  String? updatedAt;
  UserType? userType;
  String? uid;

  UserModel({
    required this.name,
    required this.email,
    this.createdAt,
    this.updatedAt,
    this.userType,
    this.uid,
  });

  factory UserModel.fromJson(dynamic json) {
    return UserModel(
        name: json['name'],
        email: json['email'],
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

  Map<String, dynamic> toFirestore() {
    assert(uid == null);
    assert(createdAt == null);
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'userType': userType!.name,
    };
  }

  @override
  String toString() {
    return '{ $name, $email,$createdAt,$updatedAt, $userType}';
  }
}

enum UserType {
  customer,
  barber,
  admin,
}
