import 'package:flutter/material.dart';
import 'package:qwys/core/theme/theme_colors.dart';

extension ThemeColorsExt on ThemeData {
  ThemeColors get colors {
    return switch (brightness) {
      Brightness.light => const LightColors(),
      Brightness.dark => const DarkColors(),
    };
  }
}
