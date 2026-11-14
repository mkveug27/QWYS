import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Flavor { dev, prod }

abstract final class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    return switch (appFlavor) {
      Flavor.dev => 'QWYS DEV',
      Flavor.prod => 'QWYS',
    };
  }

  static String get apiUrl {
    return switch (appFlavor) {
      Flavor.dev => dotenv.get('BASE_URL_DEV'),
      Flavor.prod => dotenv.get('BASE_URL_PROD'),
    };
  }
}
