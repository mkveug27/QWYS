import 'package:flutter/material.dart';

abstract class ThemeColors {
  // Base
  Color get transparent;
  Color get white;
  Color get black;

  // Text & Icon
  Color get textIconDefault;
  Color get textIconInverse;

  Color get textIconPrimaryDefault;
  Color get textIconPrimaryExtra;

  Color get textIconSecondaryDefault;
  Color get textIconSecondaryExtra;

  Color get textIconSuccess;
  Color get textIconWarning;
  Color get textIconCritical;

  // Surface
  Color get surfaceDefault;
  Color get surfaceInverse;

  Color get surfacePrimaryDefault;
  Color get surfacePrimaryExtra;

  Color get surfaceSecondaryDefault;
  Color get surfaceSecondaryExtra;

  Color get surfaceSuccess;
  Color get surfaceWarning;
  Color get surfaceCritical;
}

class LightColors implements ThemeColors {
  const LightColors();

  // Base
  @override
  Color get transparent => Colors.transparent;
  @override
  Color get white => const Color(0xFFFFFFFF);
  @override
  Color get black => const Color(0xFF1A1A1A);

  // Text & Icon
  @override
  Color get textIconDefault => const Color(0xFF2B2B2B);
  @override
  Color get textIconInverse => const Color(0xFFFAFAFA);

  @override
  Color get textIconPrimaryDefault => const Color(0xFFB84D70);
  @override
  Color get textIconPrimaryExtra => const Color(0xFF7A2E48);

  @override
  Color get textIconSecondaryDefault => const Color(0xFF7A7A7A);
  @override
  Color get textIconSecondaryExtra => const Color(0xFF4A4A4A);

  @override
  Color get textIconSuccess => const Color(0xFF4F7A63);
  @override
  Color get textIconWarning => const Color(0xFF8F6A35);
  @override
  Color get textIconCritical => const Color(0xFFA8504F);

  // Surface
  @override
  Color get surfaceDefault => const Color(0xFFF3F3F3);
  @override
  Color get surfaceInverse => const Color(0xFF2B2B2B);

  @override
  Color get surfacePrimaryDefault => const Color(0xFFF6D5E0);
  @override
  Color get surfacePrimaryExtra => const Color(0xFF7A2E48);

  @override
  Color get surfaceSecondaryDefault => const Color(0xFFE4E4E4);
  @override
  Color get surfaceSecondaryExtra => const Color(0xFF4A4A4A);

  @override
  Color get surfaceSuccess => const Color(0xFFDCE9E0);
  @override
  Color get surfaceWarning => const Color(0xFFF1E6CF);
  @override
  Color get surfaceCritical => const Color(0xFFF0D8D6);
}

class DarkColors implements ThemeColors {
  const DarkColors();

  // Base
  @override
  Color get transparent => Colors.transparent;
  @override
  Color get white => const Color(0xFFFFFFFF);
  @override
  Color get black => const Color(0xFF141414);

  // Text & Icon
  @override
  Color get textIconDefault => const Color(0xFFEDEDED);
  @override
  Color get textIconInverse => const Color(0xFF1A1A1A);

  @override
  Color get textIconPrimaryDefault => const Color(0xFFC4A8F0);
  @override
  Color get textIconPrimaryExtra => const Color(0xFF4A2F7A);

  @override
  Color get textIconSecondaryDefault => const Color(0xFFA8A8A8);
  @override
  Color get textIconSecondaryExtra => const Color(0xFFE0E0E0);

  @override
  Color get textIconSuccess => const Color(0xFF9CCFB0);
  @override
  Color get textIconWarning => const Color(0xFFE3C68F);
  @override
  Color get textIconCritical => const Color(0xFFE0A5A3);

  // Surface
  @override
  Color get surfaceDefault => const Color(0xFF242424);
  @override
  Color get surfaceInverse => const Color(0xFFEDEDED);

  @override
  Color get surfacePrimaryDefault => const Color(0xFFD8C8F2);
  @override
  Color get surfacePrimaryExtra => const Color(0xFF4A2F7A);

  @override
  Color get surfaceSecondaryDefault => const Color(0xFF363636);
  @override
  Color get surfaceSecondaryExtra => const Color(0xFFE0E0E0);

  @override
  Color get surfaceSuccess => const Color(0xFF2A3A32);
  @override
  Color get surfaceWarning => const Color(0xFF3F3626);
  @override
  Color get surfaceCritical => const Color(0xFF402C2C);
}
