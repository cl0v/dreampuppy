import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/view/help.dart';

class HelpModule extends Module {
  @override
  final List<Bind> binds = [

  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => const HelpCenterPage()),
    // ChildRoute('/faq', child: (_, __) => const HelpPage()),
    // ChildRoute('/wiki', child: (_, __) => const HelpPage()),
    // ChildRoute('/about', child: (_, __) => const HelpPage()),
    // ChildRoute('/contact', child: (_, __) => const HelpPage()),
    // ChildRoute('/tutorials', child: (_, __) => const HelpPage()),
  ];
}