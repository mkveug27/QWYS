import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qwys/core/core.dart';

class QWYSAppBarTheme {
  QWYSAppBarTheme._();

  static AppBarTheme light = AppBarTheme(
    toolbarHeight: 48,
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: LightColors().transparent,
    titleTextStyle: ThemeTypography.headlineSmall.copyWith(
      overflow: TextOverflow.ellipsis,
      color: LightColors().textIconDefault,
    ),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  );

  static AppBarTheme dark = light.copyWith(
    backgroundColor: DarkColors().transparent,
    titleTextStyle: ThemeTypography.headlineSmall.copyWith(
      overflow: TextOverflow.ellipsis,
      color: DarkColors().textIconDefault,
    ),
    systemOverlayStyle: SystemUiOverlayStyle.light,
  );
}
