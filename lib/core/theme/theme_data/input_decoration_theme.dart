import 'package:flutter/material.dart';
import 'package:qwys/core/core.dart';

class QWYSInputDecorationTheme {
  QWYSInputDecorationTheme._();

  static final InputDecorationTheme light = _build(
    colors: LightColors(),
    textTheme: QWYSTextTheme.light,
    fillColor: LightColors().surfaceSecondaryDefault,
  );

  static final InputDecorationTheme dark = _build(
    colors: DarkColors(),
    textTheme: QWYSTextTheme.dark,
    fillColor: DarkColors().surfaceSecondaryDefault,
  );

  static InputDecorationTheme _build({
    required ThemeColors colors,
    required TextTheme textTheme,
    required Color fillColor,
  }) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    );

    return InputDecorationTheme(
      // Layout
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: mPadding,
        vertical: sPadding,
      ),

      // Icons
      iconColor: colors.textIconDefault,
      prefixIconColor: colors.textIconDefault,
      suffixIconColor: colors.textIconDefault,

      // Fill
      filled: true,
      fillColor: fillColor,

      // Text styles
      labelStyle: textTheme.bodyLarge,
      floatingLabelStyle:
          (textTheme.labelSmall ?? ThemeTypography.labelSmall).copyWith(
        color: colors.textIconSecondaryDefault,
      ),
      helperStyle: textTheme.titleSmall,
      hintStyle: (textTheme.bodyLarge ?? ThemeTypography.bodyLarge).copyWith(
        color: colors.textIconDefault,
      ),
      prefixStyle: textTheme.bodyLarge,
      suffixStyle: (textTheme.bodyLarge ?? ThemeTypography.bodyLarge).copyWith(
        color: colors.textIconDefault,
      ),

      // Borders
      border: border,
      enabledBorder: border,
      focusedBorder: border,
      focusedErrorBorder: border,
      disabledBorder: border,
      errorBorder: border,

      // Other
      hintFadeDuration: const Duration(milliseconds: 100),
      errorMaxLines: 2,
    );
  }
}
