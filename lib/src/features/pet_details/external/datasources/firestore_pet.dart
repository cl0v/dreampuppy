import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreampuppy/src/_domain/entities/pet.dart';
import 'package:dreampuppy/src/utils/collections_prefix.dart';
import '../../infra/datasources/pet.dart';

class FirestorePetDataSourceImpl implements PetDataSource {
  final FirebaseFirestore firestore;

  FirestorePetDataSourceImpl(this.firestore);

  @override
  Stream<Pet> fetchPetByID(String id) async* {
    //TODO: Tratar erros de falha de conexão.
    final r = await firestore.getCollection('pets').doc(id).get();
    // .snapshots()
    // .map((snapshot) => Pet.fromJson(snapshot.data()!));
    if (r.data() == null) {
      //TODO: Caso seja um pet não encontrado, permitir o user voltar para a home.
      //TODO: Para isso preciso me comunicar por tipos ou por códigos.
      yield* Stream.error('Filhote não encontrado.');
      return;
    }
    final r1 = Pet.fromJson(r.data()!);
    yield* Future.value(r1).asStream();
  }
}
