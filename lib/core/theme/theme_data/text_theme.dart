import 'package:flutter/material.dart';

import 'package:qwys/core/core.dart';

class QWYSTextTheme {
  QWYSTextTheme._();

  static final light = _create(
    bodyColor: LightColors().textIconDefault,
    displayColor: LightColors().textIconDefault,
  );

  static final dark = _create(
    bodyColor: DarkColors().textIconDefault,
    displayColor: DarkColors().textIconDefault,
  );

  static TextTheme _create({
    required Color bodyColor,
    required Color displayColor,
  }) {
    return const TextTheme(
      displayLarge: ThemeTypography.displayLarge,
      displayMedium: ThemeTypography.displayMedium,
      displaySmall: ThemeTypography.displaySmall,
      headlineLarge: ThemeTypography.headlineLarge,
      headlineMedium: ThemeTypography.headlineMedium,
      headlineSmall: ThemeTypography.headlineSmall,
      titleLarge: ThemeTypography.titleLarge,
      titleMedium: ThemeTypography.titleMedium,
      titleSmall: ThemeTypography.titleSmall,
      bodyLarge: ThemeTypography.bodyLarge,
      bodyMedium: ThemeTypography.bodyMedium,
      bodySmall: ThemeTypography.bodySmall,
      labelLarge: ThemeTypography.labelLarge,
      labelMedium: ThemeTypography.labelMedium,
      labelSmall: ThemeTypography.labelSmall,
    ).apply(
      bodyColor: bodyColor,
      displayColor: displayColor,
    );
  }
}
