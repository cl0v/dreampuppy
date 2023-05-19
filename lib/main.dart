import 'package:dreampuppy/app.dart';
import 'package:dreampuppy/app.module.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sentry_logging/sentry_logging.dart';
import 'dart:async';

void main() async {
  runZonedGuarded(() async {
    await SentryFlutter.init(
      (options) {
        options.dsn = kDebugMode
            ? 'https://61478d97f0b045b79c82d6657560a9ff@o4505183398068224.ingest.sentry.io/4505205438611456'
            : 'https://656e02b6c76d4eff8c06a33bc809b71b@o4505183398068224.ingest.sentry.io/4505183399182336';
        // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
        // We recommend adjusting this value in production.
        options.tracesSampleRate = kDebugMode ? 1.0 : 0.3;
        options.addIntegration(LoggingIntegration());
      },
      appRunner: () => runApp(
        ModularApp(
          module: AppModule(),
          child: const App(),
        ),
      ),
    );
  }, (exception, stackTrace) async {
    await Sentry.captureException(exception, stackTrace: stackTrace);
  });
}
