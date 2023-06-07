import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
                    child: LinearProgressIndicator(
                      value: progress.toDouble()/100,
                    ),
                  ),
                );
              }
              return WebViewWidget(
                controller: controller,
              );
            }),
      ),
    );
  }
}
