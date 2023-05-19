import 'package:algolia/algolia.dart';

class AlgoliaApplication {
    late Algolia algolia;

    AlgoliaApplication(){
      algolia = const Algolia.init(
      applicationId: 'W662ONV5CU',
      apiKey: '25d733041802e6f711fcd53f59fbac25',
    );
    }
  }