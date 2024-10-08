import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

//TODO: BUG: O WebView não funciona no Android
//TODO: Toda vez que toco para entrar nessa página, da uma pequena travada
class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key});

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {
  late WebViewController controller;

  final progressBarNotifier = ValueNotifier<int>(0);

  @override
  initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            progressBarNotifier.value = progress;
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
        ),
      )
      ..loadRequest(
        Uri.parse(
          'https://glittery-kick-6e5.notion.site/Central-de-ajuda-DreamPuppy-4ff958bbbabc40de84aea594738af995',
        ),
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ValueListenableBuilder<int>(
          valueListenable: progressBarNotifier,
          builder: (_, progress, __) {
            if (progress < 100) {
              return Center(
                child: SizedBox(
                  width: 248,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Acionando o cão guia...",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 4),
                      LinearProgressIndicator(
                        value: progress.toDouble() / 100,
                      ),
                    ],
                  ),
                ),
              );
            }
            //TODO: Quando toco em botões que me redirecionam para o zap dentro do webview ele entra na tela de loading novamente
            return WebViewWidget(
              controller: controller,
            );
          },
        ),
      ),
    );
  }
}
