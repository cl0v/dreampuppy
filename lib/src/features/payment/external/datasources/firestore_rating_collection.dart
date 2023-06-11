import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreampuppy/src/utils/collections_prefix.dart';

import '../../infra/datasources/rating_service.dart';

/// Envia os dados de cada aviação de forma anonima para o firestore
/// Avisar do anonimato garantido ✅ na hora da avaliação
///
/// Os dados serão enviados para cada vez que o user tocar em uma estrela,
/// conservando o id de avaliação e apenas "somando" o novo valor
class FirestoreRatingCollectionDataSourceImpl implements RatingServiceDataSource {
  final FirebaseFirestore _firestore;

  FirestoreRatingCollectionDataSourceImpl(this._firestore);

  String? ratingDocId;

  CollectionReference<Map<String, dynamic>> get collection =>
      _firestore.getCollection('ratings');

  @override
  Future<void> comment(
    String from,
    String comment,
  ) async {
    ratingDocId ??= (await collection.add({"createdAt": Timestamp.now()})).id;
    return collection.doc(ratingDocId).update({
      from: comment,
    });
  }

  @override
  Future<void> rate({required String feature, required int rating}) async{
    ratingDocId ??= (await collection.add({"createdAt": Timestamp.now()})).id;
    return collection.doc(ratingDocId).update({
      feature: rating,
    });
  }
}
