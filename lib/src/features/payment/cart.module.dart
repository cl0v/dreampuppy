import 'package:flutter_modular/flutter_modular.dart';
import 'presenter/view/cart_page.dart';

class CartModule extends Module {
  @override
  final List<Bind> binds = [
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/cart', child: (_, __) => const CartPage()),
    ChildRoute('/done', child: (_, __) => const CartPage()),
  ];
}