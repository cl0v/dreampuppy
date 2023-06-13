import 'package:dreampuppy/.archive/src/features/pet_apply_filters_incomplete/presentation/view/breed_details.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../features/pet_list/presentation/view/breed_list.dart';

class BreedsModule extends Module {
  @override
  get binds => [];

  @override
  get routes => [
        ChildRoute('/', child: (context, args) => const BreedListPage()),
        ChildRoute(
          '/about/?breed=Shih-tzu',
          child: (context, args) {
            return BreedDetailsPage(
              // TODO: Passar o da raça para que seja pesquisada na sessão de about.
              breed: args.params['breed'],
            );
          },
        ),
      ];
}
