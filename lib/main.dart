import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'package:qwys/app/app.dart';
import 'package:qwys/core/core.dart';
import 'package:qwys/core/di/di_config.dart';
import 'package:qwys/core/i18n/strings.g.dart';
import 'package:qwys/features/features.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');
  await initDependencies();
  await LocaleCubit.restore();

  FlutterError.onError = (details) {
    getIt<Talker>().handle(details.exception, details.stack);
  };

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => ThemeCubit()),
      BlocProvider(create: (_) => LocaleCubit()),
    ],
    child: TranslationProvider(
      child: const QWYSApp(),
    ),
  ));
}
