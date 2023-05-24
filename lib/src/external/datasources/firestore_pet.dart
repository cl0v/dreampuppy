
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreampuppy/src/_domain/entities/pet.dart';

import '../../_infra/datasources/pet.dart';


class FirestorePetDataSourceImpl implements PetDataSource {
  final FirebaseFirestore firestore;

  FirestorePetDataSourceImpl(this.firestore);

  @override
  Stream<Pet> fetchPetByID(String id) {
    return firestore
        .collection('pets')
        .doc(id)
        .snapshots()
        //TODO: Testar se existe alguma chance de vir nulo nesse endpoint
        .map((snapshot) => Pet.fromJson(snapshot.data()!));
  }
}