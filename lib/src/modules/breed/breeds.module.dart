import 'package:dreampuppy/.archive/src/features/pet_apply_filters_incomplete/presentation/view/breed_details.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/view/list.dart';
// import 'package:dreampuppy/src/modules/help/presenter/view/help.dart';
// import 'package:dreampuppy/src/features/authentication/authentication.module.dart';
// import './infra/datasources/search.dart';
// import './infra/repositories/search.dart';
// import './domain/usecases/save_search.dart';
// import './external/datasources/search.dart';


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
