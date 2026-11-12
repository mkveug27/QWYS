import 'package:flutter/material.dart';
import 'package:qwys/core/core.dart';

class QWYSProgressIndicatorTheme {
  QWYSProgressIndicatorTheme._();

  static ProgressIndicatorThemeData light = ProgressIndicatorThemeData(
    color: LightColors().surfacePrimaryDefault,
  );

  static ProgressIndicatorThemeData dark = ProgressIndicatorThemeData(
    color: DarkColors().surfacePrimaryDefault,
  );
}
