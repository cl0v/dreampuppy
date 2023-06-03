import 'package:flutter/services.dart';

class Config {
  static const BASE_URL = 'https://dreampuppy.com.br';
}


class SystemConfig {
  static changeStatusBarColor(Color? color){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: color,
    ));
  }
}