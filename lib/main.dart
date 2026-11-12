import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'package:qwys/core/i18n/strings.g.dart';
import 'package:qwys/qwys_app.dart';

import 'di/di.dart';
import 'features/features.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');
  await initDependencies();
  await initAppLocale();

  FlutterError.onError = (details) {
    getIt<Talker>().handle(details.exception, details.stack);
  };

  runApp(BlocProvider(
    create: (_) => ThemeCubit(),
    child: TranslationProvider(
      child: const QWYSApp(),
    ),
  ));
}

Future<void> initAppLocale() async {
  final locale = AppLocaleUtils.findDeviceLocale();
  await LocaleSettings.setLocale(locale);
}
