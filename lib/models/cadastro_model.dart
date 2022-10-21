import 'package:cloud_firestore/cloud_firestore.dart';

class Cadastro {
  String? name;
  String? email;
  String? password;
  String? dataCriacao;
  String? dataModificacao;
  String? nivel;
  String? uid;

  Cadastro(
      {this.name,
      this.dataCriacao,
      this.dataModificacao,
      this.email,
      this.nivel,
      this.password,
      this.uid});

  factory Cadastro.fromJson(dynamic json) {
    return Cadastro(
        name: json['name'],
        email: json['email'],
        password: json['password'],
        dataCriacao: json['dataCriacao'],
        dataModificacao: json['dataModificacao'],
        nivel: json['nivel']);
  }

  factory Cadastro.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Cadastro(
      name: data?['name'],
      email: data?['email'],
      password: data?['password'],
      dataCriacao: data?['dataCriacao'],
      dataModificacao: data?['dataModificacao'],
      nivel: data?['nivel'],
      uid: data?['uid'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'password': password,
      'dataCriacao': dataCriacao,
      'dataModificacao': dataModificacao,
      'nivel': nivel,
    };
  }

  static Cadastro fromSnapshot(DocumentSnapshot snap) {
    Cadastro cadastro = Cadastro(
        name: snap['name'],
        email: snap['email'],
        password: snap['password'],
        dataCriacao: snap['dataCriacao'],
        dataModificacao: snap['dataModificacao'],
        nivel: snap['nivel']);
    return cadastro;
  }

  @override
  String toString() {
    return '{ $name, $email, $password,$dataCriacao,$dataModificacao, $nivel}';
  }
}
