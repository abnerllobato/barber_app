import 'package:barbearia_app/models/cadastro_model.dart';

abstract class BaseCadastroRepository {
  Stream<List<Cadastro>> getAllCategories();
}
