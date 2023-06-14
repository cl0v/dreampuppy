import 'package:algolia/algolia.dart';

class AlgoliaApplication {
    late Algolia algolia;

    AlgoliaApplication(){
      algolia = const Algolia.init(
      applicationId: 'VIHVO0WIC9',
      apiKey: '8cb97181f2d94fad2b5d3d0d3fd22caa', 
    );
    }
  }