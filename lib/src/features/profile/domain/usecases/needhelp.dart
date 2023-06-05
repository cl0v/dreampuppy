import 'package:url_launcher/url_launcher.dart';

abstract class NeedHelpUseCase {
  Future call(String msg);
}

class NeedHelpUseCaseImpl implements NeedHelpUseCase {
  @override
  Future call(msg) async {
    const phoneNumber = '5533998744781';
    final message = Uri.encodeFull(msg);

    //TODO: Testar se o link funciona para iOS e Android
    final url = 'https://wa.me/$phoneNumber?text=$message';
    // final url =
    //     'whatsapp://send?phone=$phoneNumber?text=${Uri.encodeComponent(message)}';

    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Não foi possível abrir o WhatsApp!';
    }
  }
}
