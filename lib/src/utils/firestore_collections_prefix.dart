import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../main.dart';

String get prefix {
  if (kDebugMode) return 'dev_';
  switch (usageBuildStage) {
    case UsageBuildStage.development:
      return 'dev_';
    case UsageBuildStage.staging:
      return 'stg_';
    case UsageBuildStage.production:
      return '';
  }
}

extension Firestore on FirebaseFirestore {
  CollectionReference<Map<String, dynamic>> getCollection(
          String collectionName) =>
      collection('$prefix$collectionName');
}
