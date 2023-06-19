import 'package:dreampuppy/main_app.dart';
import 'package:dreampuppy/main_app.module.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sentry_logging/sentry_logging.dart';
import 'dart:async';
import 'firebase_options.dart';
import 'package:flutter_uxcam/flutter_uxcam.dart';

//TODO: Adicionar credenciais de desenvolvedor e invalidar toda e qualquer ação que pode atrapalhar o funcionamento do app.
// Login a ser usado: (email: openAccount@dreampuppy.com.br, senha: @developer@)

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
        // Estudar esse parametro options.tracesSampler //https://docs.sentry.io/platforms/javascript/performance/
        options.addIntegration(LoggingIntegration());
      },
      appRunner: () async {
        WidgetsFlutterBinding.ensureInitialized();
        FlutterUxcam
            .optIntoSchematicRecordings(); // Confirm that you have user permission for screen recording
        FlutterUxConfig config = FlutterUxConfig(
          userAppKey: "piiwng1ux20g3sh", //TODO: Solicitar ao UXCAM uma 
          enableAutomaticScreenNameTagging: false,
        );
        FlutterUxcam.startWithConfiguration(config);

        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );

        // if(kDebugMode) await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

        // To keep the screen on:
        // Wakelock.enable(); // or Wakelock.toggle(on: true);
        runApp(
          ModularApp(
            module: AppModule(),
            child: const App(),
          ),
        );
      },
    );
  }, (exception, stackTrace) async {
    await Sentry.captureException(exception, stackTrace: stackTrace);
  });
}
