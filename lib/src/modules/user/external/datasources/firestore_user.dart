import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreampuppy/src/utils/collections_prefix.dart';

import '../../domain/profile/entities/user_sensitive_data.dart';
import '../../infra/datasources/user_datasource.dart';

class FirestoreUserDataSourceI implements IUserDataSource {
  final FirebaseFirestore firestore;

  FirestoreUserDataSourceI(this.firestore);

  CollectionReference<Map<String, dynamic>> get collection =>
      firestore.getCollection('/user');

  @override
  Future<void> create(String uuid, UserSensitiveDataEntity data) {
    return collection.doc(uuid).set(data.toJson());
  }
}
