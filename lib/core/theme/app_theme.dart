import 'package:flutter/material.dart';
import 'package:qwys/core/core.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = _buildTheme(
    colors: LightColors(),
    brightness: Brightness.light,
    appBarTheme: QWYSAppBarTheme.light,
    dividerTheme: QWYSDividerTheme.light,
    inputDecorationTheme: QWYSInputDecorationTheme.light,
    textTheme: QWYSTextTheme.light,
    progressIndicatorTheme: QWYSProgressIndicatorTheme.light,
  );

  static final ThemeData darkTheme = _buildTheme(
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
    return ThemeData(
      // Input
      inputDecorationTheme: inputDecorationTheme,

      // Material
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: colors.surfacePrimaryDefault,
        brightness: brightness,
      ),

      // Colors
      canvasColor: colors.surfaceDefault,
      highlightColor: colors.textIconDefault.withValues(alpha: 0.04),
      scaffoldBackgroundColor: colors.surfaceDefault,
      splashColor: colors.textIconDefault.withValues(alpha: 0.04),

      // Typography
      fontFamily: 'OpenSans',
      textTheme: textTheme,

      // Components
      appBarTheme: appBarTheme,
      dividerTheme: dividerTheme,
      progressIndicatorTheme: progressIndicatorTheme,
    );
  }
}
