
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreampuppy/src/_domain/entities/pet.dart';
import 'package:dreampuppy/src/utils/collections_prefix.dart';

import '../../infra/datasources/pet.dart';


class FirestorePetDataSourceImpl implements PetDataSource {
  final FirebaseFirestore firestore;

  FirestorePetDataSourceImpl(this.firestore);

  @override
  Stream<Pet> fetchPetByID(String id) {
    //TODO: Tratar erros de falha de conexão.
    return firestore.getCollection('pets')
        .doc(id)
        .snapshots()
        .map((snapshot) => Pet.fromJson(snapshot.data()!));
  }
}