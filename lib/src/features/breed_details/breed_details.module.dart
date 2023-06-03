import 'package:dreampuppy/src/features/breed_details/presentation/view/breed_details.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BreedDetailsModule extends Module {
  @override
  get binds => [];

  @override
  get routes => [
        ChildRoute(
          '/:breed',
          child: (context, args) {
            return BreedDetailsPage(breed: args.params['breed'],);
          },
        ),
      ];
}
