import 'package:cloud_firestore/cloud_firestore.dart';

class Cadastro {
  final String name;
  final String email;
  final String password;
  final String dataCriacao;
  final String dataModificacao;
  final String nivel;

  Cadastro(
      {required this.name,
      required this.email,
      required this.password,
      required this.dataCriacao,
      required this.dataModificacao,
      required this.nivel});

  factory Cadastro.fromJson(dynamic json) {
    return Cadastro(
        name: json['name'],
        email: json['email'],
        password: json['password'],
        dataCriacao: json['dataCriacao'],
        dataModificacao: json['dataModificacao'],
        nivel: json['nivel']);
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
    return '{ $name, $email, $password }';
  }
}
