import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dreampuppy/src/utils/firestore_collections_prefix.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../infra/datasources/search.dart';

class SearchDataSourceImpl implements SearchDataSource {
  final FirebaseFirestore firestore;

  CollectionReference<Map<String, dynamic>> get collection =>
      firestore.getCollection('searches');

  SearchDataSourceImpl(this.firestore);

  @override
  Future<void> saveSearch(String search) async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final info = await deviceInfo.deviceInfo;
    final String version = packageInfo.version;
    final String buildNumber = packageInfo.buildNumber;

    await collection.add({
      'search': search,
      'at': DateTime.now(),
      'deviceInfo': info.data,
      'version': '$version+$buildNumber',
    });
  }
}
