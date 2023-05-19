import 'package:dreampuppy/src/features/breed_details/presentation/view/breed_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BreedDetailsModule extends Module {
  @override
  get binds => [];

  @override
  get routes => [
    ChildRoute('/dogs/:breed', child: (context, args) {
      final breed = args.params['breed'];
      // if(breed == 'rottweiler'){
      // }
      return BreedDetailsPage(path: breed ,);
    },),
    ChildRoute('/dogs/:breed/:productId', child: (context, args) {
      print(args.params['breed']);
      print(args.params['productId']);
      return const Text('oi'
      );
    },)
  ];
}
