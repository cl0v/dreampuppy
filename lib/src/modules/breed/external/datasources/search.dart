// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dreampuppy/src/utils/collections_prefix.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../infra/datasources/search.dart';
import 'package:dio/dio.dart';

class SearchDataSourceImpl implements SearchDataSource {
  // final FirebaseFirestore firestore;

  // CollectionReference<Map<String, dynamic>> get collection =>
  //     firestore.getCollection('searches');

  // SearchDataSourceImpl(this.firestore);

  @override
  Future<void> saveSearch(String search) async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final info = await deviceInfo.deviceInfo;
    final String version = packageInfo.version;
    final String buildNumber = packageInfo.buildNumber;

    var dio = Dio(BaseOptions(baseUrl: "http://192.168.1.106:8000"));

    await dio.put('/searches', data: {
      'message': search,
      // 'date': DateTime.now(),
      // 'deviceInfo': info.data,
      'version': '$version+$buildNumber',
    });
  }
}
