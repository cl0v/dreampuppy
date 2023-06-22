import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreampuppy/src/modules/user/domain/address/entities/address.dart';
import 'package:dreampuppy/src/utils/collections_prefix.dart';

import '../../domain/profile/entities/user_sensitive_data.dart';
import '../../infra/datasources/user_datasource.dart';

class FirestoreUserDataSourceI implements IUserDataSource {
  final FirebaseFirestore firestore;

  FirestoreUserDataSourceI(this.firestore);

  String? userId;
  
  CollectionReference<Map<String, dynamic>> get collection =>
      firestore.getCollection('user');

  @override
  Future<void> create(UserSensitiveDataEntity data) async {
    final ref = await collection.add(data.toJson());
    userId = ref.id;
    return;
  }

  @override
  Future<void> registerAddress(AddressEntity address) =>
      collection.doc(userId).update(address.toJson());
}
