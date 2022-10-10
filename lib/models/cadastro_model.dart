class Cadastro {
  final String name;
  final String email;
  final String password;

  Cadastro({required this.name, required this.email, required this.password});

  factory Cadastro.fromJson(dynamic json) {
    return Cadastro(
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  @override
  String toString() {
    return '{ $name, $email, $password }';
  }
}
