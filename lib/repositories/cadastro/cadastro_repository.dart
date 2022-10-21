import 'package:barbearia_app/models/cadastro_model.dart';
import 'package:barbearia_app/repositories/cadastro/base_cadastro_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CadastroRepository extends BaseCadastroRepository {
  final FirebaseFirestore _firebaseFirestore;

  CadastroRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Cadastro>> getAllCategories() {
    return _firebaseFirestore.collection('users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Cadastro.fromSnapshot(doc)).toList();
    });
  }
}
