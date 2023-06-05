import 'package:url_launcher/url_launcher.dart';

/// Atualmente o botão de Sobre leva o user para o instagram da dreampuppy
abstract class OpenAboutUseCase {
  call();
}

class OpenAboutUseCaseImpl implements OpenAboutUseCase {
  @override
  call() async {
    const url = 'https://www.instagram.com/dreampuppy.com.br/';
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Não foi possível abrir o Instagram!';
    }
  }
}