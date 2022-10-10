import 'package:barbearia_app/models/cadastro_model.dart';

class BarbeiroRepository {
  final List<Cadastro> _barbeiros = [];

  List<Cadastro> loadBarbeiros() {
    _barbeiros.addAll([
      Cadastro(name: "Abner", email: "Abner@Abner", password: "1515"),
    ]);
    return _barbeiros;
  }

  List<Cadastro> addClient(Cadastro barbeiro) {
    _barbeiros.add(barbeiro);
    return _barbeiros;
  }

  List<Cadastro> removeClient(Cadastro barbeiro) {
    _barbeiros.remove(barbeiro);
    return _barbeiros;
  }
}
