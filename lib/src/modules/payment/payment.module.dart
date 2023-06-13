import 'package:flutter_modular/flutter_modular.dart';

import '../../features/payment/domain/usecases/comments.dart';
import '../../features/payment/domain/usecases/rate.dart';
import '../../features/payment/domain/usecases/store_rating.dart';

import '../../features/payment/infra/repositories/rate.dart';
import '../../features/payment/infra/datasources/rating_service.dart';

import '../../features/payment/external/datasources/firestore_rating_collection.dart';

import 'presenter/view/done.dart';
import 'presenter/view/cart.dart';
import 'presenter/view/requirements.dart';
import 'presenter/view/review.dart';

class PaymentModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<RatingServiceDataSource>(
        (i) => FirestoreRatingCollectionDataSourceImpl(i())),
    Bind.factory<RateRepository>((i) => RateRepositoryImpl(i())),
    Bind.factory<RateUseCase>((i) => RateUseCaseImpl(i())),
    Bind.factory<SendCommentUseCase>((i) => SendCommentUseCaseImpl(i())),
    Bind.factory<StoreRatingUseCase>((i) => StoreRatingUseCaseImp()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/cart', child: (_, __) => const CartPage()),
    ChildRoute('/done', child: (_, __) => const PaymentDonePage()),
    ChildRoute('/requirements',
        child: (_, __) => const PaymentUserRequirementsPage()),
    ChildRoute('/review', child: (_, __) => const PaymentReviewPage()),
  ];
}
