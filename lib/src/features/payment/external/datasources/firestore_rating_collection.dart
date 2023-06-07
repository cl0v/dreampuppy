import 'package:cloud_firestore/cloud_firestore.dart';

import '../../infra/datasources/rating_service.dart';

/// Envia os dados de cada aviação de forma anonima para o firestore
/// Avisar do anonimato garantido ✅ na hora da avaliação
///
/// Os dados serão enviados para cada vez que o user tocar em uma estrela,
/// conservando o id de avaliação e apenas "somando" o novo valor
///
/// Adicionar campo de comentário também
class FirestoreRatingCollection implements RatingServiceDataSource {
  @override
  String? ratingDocId;

  final FirebaseFirestore firestore;

  FirestoreRatingCollection(this.firestore);

  CollectionReference<Map<String, dynamic>> get collection =>
      firestore.collection('ratings');

  @override
  Future<void> comment(String comment) {
    // TODO: implement comment
    throw UnimplementedError();
  }

  @override
  Future<void> rate({required String feature, required int rating}) {
    // TODO: implement rate
    throw UnimplementedError();
  }
}
