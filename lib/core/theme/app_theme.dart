import 'package:flutter/material.dart';
import 'package:qwys/core/core.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = _buildTheme(
    colors: LightColors(),
    brightness: Brightness.light,
    appBarTheme: QWYSAppBarTheme.light,
    dividerTheme: QWYSDividerTheme.light,
    inputDecorationTheme: QWYSInputDecorationTheme.light,
    textTheme: QWYSTextTheme.light,
    progressIndicatorTheme: QWYSProgressIndicatorTheme.light,
  );

  static ThemeData darkTheme = _buildTheme(
    colors: DarkColors(),
    brightness: Brightness.dark,
    appBarTheme: QWYSAppBarTheme.dark,
    dividerTheme: QWYSDividerTheme.dark,
    inputDecorationTheme: QWYSInputDecorationTheme.dark,
    textTheme: QWYSTextTheme.dark,
    progressIndicatorTheme: QWYSProgressIndicatorTheme.dark,
  );

  static ThemeData _buildTheme({
    required ThemeColors colors,
    required Brightness brightness,
    required AppBarTheme appBarTheme,
    required DividerThemeData dividerTheme,
    required InputDecorationTheme inputDecorationTheme,
    required TextTheme textTheme,
    required ProgressIndicatorThemeData progressIndicatorTheme,
  }) {
    final isDark = brightness == Brightness.dark;
    final background = isDark ? colors.black : colors.white;

    final colorScheme = ColorScheme.fromSeed(
      seedColor: colors.surfacePrimaryDefault,
      brightness: brightness,
    ).copyWith(
      primary: colors.textIconPrimaryDefault,
      onPrimary: colors.textIconPrimaryExtra,
      secondary: colors.textIconSecondaryDefault,
      onSecondary: colors.textIconSecondaryExtra,
      error: colors.textIconCritical,
      surface: background,
      onSurface: colors.textIconDefault,
      onSurfaceVariant: colors.textIconSecondaryDefault,
      surfaceTint: colors.transparent,
      surfaceContainerLowest: background,
      surfaceContainerLow: colors.surfaceDefault,
      surfaceContainer: colors.surfaceDefault,
      surfaceContainerHigh: colors.surfaceSecondaryDefault,
      surfaceContainerHighest: colors.surfaceSecondaryDefault,
      outline: colors.textIconSecondaryDefault,
      outlineVariant: colors.surfaceSecondaryDefault,
    );

    return ThemeData(
      // Input
      inputDecorationTheme: inputDecorationTheme,

      // Material
      useMaterial3: true,
      colorScheme: colorScheme,

      // Colors
      canvasColor: background,
      scaffoldBackgroundColor: background,
      highlightColor: colors.textIconDefault.withValues(alpha: 0.04),
      splashColor: colors.textIconDefault.withValues(alpha: 0.04),

      // Typography
      fontFamily: 'Cormorant',
      textTheme: textTheme,

      // Components
      appBarTheme: appBarTheme,
      dividerTheme: dividerTheme,
      progressIndicatorTheme: progressIndicatorTheme,
    );
  }
}
