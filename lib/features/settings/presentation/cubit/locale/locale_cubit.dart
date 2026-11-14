import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:qwys/core/i18n/strings.g.dart';

class LocaleCubit extends Cubit<AppLocale> {
  static const _key = 'locale';

  LocaleCubit() : super(LocaleSettings.currentLocale);

  static Future<void> restore() async {
    final prefs = await SharedPreferences.getInstance();
    final tag = prefs.getString(_key);

    final locale = tag != null
        ? AppLocaleUtils.parse(tag)
        : AppLocaleUtils.findDeviceLocale();

    await LocaleSettings.setLocale(locale);
  }

  Future<void> setLocale(AppLocale locale) async {
    if (locale == state) return;

    await LocaleSettings.setLocale(locale);
    emit(locale);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, locale.languageTag);
  }
}
