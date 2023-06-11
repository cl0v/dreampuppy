import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'DreamPuppy - Galeria de filhotes',
        themeMode: ThemeMode.dark,
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
    );
  }
}
