import 'package:algolia/algolia.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

//TODO: Testar se prefixo está funcionando
String get prefix {
  if (kDebugMode) return 'dev_';
  if (kProfileMode) return 'stg_';
  if (kProfileMode) return '';
  Sentry.captureMessage(
      'Prefix not found, using empty string (defaults to Prod)');
  return '';
}

extension FirestorePrefix on FirebaseFirestore {
  CollectionReference<Map<String, dynamic>> getCollection(
          String collectionName) =>
      collection('$prefix$collectionName');
}

extension AlgoliaPrefix on Algolia {
  AlgoliaIndexReference getCollection(String collectionName) =>
      index('$prefix$collectionName');
}
