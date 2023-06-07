import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

abstract class StoreRatingUseCase {
  call();
}

class StoreRatingUseCaseImp implements StoreRatingUseCase{
  @override
  call() async {
   final url = Platform.isIOS
        ? 'https://apps.apple.com/br/app/whatsapp-messenger/id310633997' //TODO: Mudar para o link do app na App Store
        : 'https://play.google.com/store/apps/details?id=com.whatsapp&hl=pt_BR&gl=US'; //TODO: Mudar para o link do app na Play Store
    // final url =
    //     'whatsapp://send?phone=$phoneNumber?text=${Uri.encodeComponent(message)}';

    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Não foi possível abrir a loja!';
    }
  }
}