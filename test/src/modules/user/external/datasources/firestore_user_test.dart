import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreampuppy/src/modules/user/domain/profile/entities/user_sensitive_data.dart';
import 'package:dreampuppy/src/modules/user/external/datasources/firestore_user.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final FirestoreUserDataSourceI firestoreUserDataSource;
  late FirebaseFirestore firestore;
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    setupFirebaseCoreMocks(); // Just to make sure it that no exception is thrown.
    firestore = FakeFirebaseFirestore();
    firestoreUserDataSource = FirestoreUserDataSourceI(firestore);
  });

  test('firestore user', () async {
    await firestoreUserDataSource.create(
      UserSensitiveDataEntity(
        name: 'name',
        phone: 'phone',
        cpf: 'cpf',
      )..email = '@email',
    );
    final c = await firestore.collection('dev_user').count().get();

    expect(c.count, equals(1));
  });
}
