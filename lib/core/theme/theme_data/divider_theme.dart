import 'package:flutter/material.dart';
import 'package:qwys/core/core.dart';

class QWYSDividerTheme {
  QWYSDividerTheme._();

  static DividerThemeData light = DividerThemeData(
    color: LightColors().textIconDefault,
    thickness: 1,
    indent: 0,
    endIndent: 0,
  );

  static DividerThemeData dark = DividerThemeData(
    color: DarkColors().textIconDefault,
    thickness: 1,
    indent: 0,
    endIndent: 0,
  );
}
