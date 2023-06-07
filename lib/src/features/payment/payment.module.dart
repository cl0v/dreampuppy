import 'package:dreampuppy/src/features/payment/presenter/view/done.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'domain/usecases/comments.dart';
import 'domain/usecases/rate.dart';
import 'domain/usecases/store_rating.dart';
import 'presenter/view/cart_page.dart';

class PaymentModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory<StoreRatingUseCase>((i) => StoreRatingUseCaseImp()),
    Bind.factory<SendCommentUseCase>((i) => SendCommentUseCaseImpl()),
    Bind.factory<RateUseCase>((i) => RateUseCaseImpl()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/cart', child: (_, __) => const CartPage()),
    ChildRoute('/done', child: (_, __) => const PaymentDonePage()),
  ];
}