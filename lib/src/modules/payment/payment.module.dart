import 'package:flutter_modular/flutter_modular.dart';
//TODO: Trazer todos eles prak
import 'external/datasources/firestore_rating_collection.dart';
import 'infra/repositories/app_rate.dart';
import 'infra/datasources/app_rating_service.dart';
import 'domain/done/usecases/comments.dart';
import 'domain/done/usecases/rate.dart';
import 'domain/done/usecases/request_contact.dart';
import 'domain/done/usecases/store_rating.dart';
import 'presenter/view/done.dart';
import 'presenter/view/cart_page.dart';
import 'presenter/view/pay.dart';

class PaymentModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<AppRatingServiceDataSource>(
        (i) => FirestoreRatingCollectionDataSourceImpl(i())),
    Bind.factory<RateAppRepository>((i) => RateAppRepositoryImpl(i())),
    Bind.factory<RateUseCase>((i) => RateUseCaseImpl(i())),
    Bind.factory<SendCommentUseCase>((i) => SendCommentUseCaseImpl(i())),
    Bind.factory<StoreRatingUseCase>((i) => StoreRatingUseCaseImp()),

    // Done
    Bind.factory<RequestContactUseCase>((i) => WhatsAppContactUseCaseImpl()),
    // END Done
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/cart',
        child: (_, args) => CartPage(
              cardEntity: args.data,
            )),
    ChildRoute('/done', child: (_, __) => const PaymentDonePage()),
    // ChildRoute('/requirements',
    //     child: (_, __) => const PaymentUserRequirementsPage()),
    ChildRoute('/review', child: (_, __) => const PaymentPayPage()),
  ];
}
