import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/comments.dart';
import 'domain/usecases/rate.dart';
import 'domain/usecases/store_rating.dart';

import 'infra/repositories/rate.dart';
import 'infra/datasources/rating_service.dart';

import 'external/datasources/firestore_rating_collection.dart';

import 'presenter/view/done.dart';
import 'presenter/view/cart_page.dart';
import 'presenter/view/requirements.dart';


class PaymentModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory<StoreRatingUseCase>((i) => StoreRatingUseCaseImp()),
    Bind.lazySingleton<RatingServiceDataSource>((i) => FirestoreRatingCollectionDataSourceImpl(i())),
    Bind.factory<RateRepository>((i) => RateRepositoryImpl(i())),
    Bind.factory<SendCommentUseCase>((i) => SendCommentUseCaseImpl(i())),
    Bind.factory<RateUseCase>((i) => RateUseCaseImpl(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/cart', child: (_, __) => const CartPage()),
    ChildRoute('/done', child: (_, __) => const PaymentDonePage()),
    ChildRoute('/requirements', child: (_, __) => const PaymentRequirementsPage()),
  ];
}