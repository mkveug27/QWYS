import 'package:flutter/material.dart';

abstract class ThemeColors {
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
  Color get surfaceSecondaryDefault;

  Color get surfaceSuccess;
  Color get surfaceWarning;
  Color get surfaceCritical;
}

class LightColors implements ThemeColors {
  const LightColors();

  @override
  Color get transparent => Colors.transparent;

  @override
  Color get white => const Color(0xFFFFFFFF);
  @override
  Color get black => const Color(0xFF241F29);

  // Text & Icon
  @override
  Color get textIconDefault => const Color(0xFF342D38);
  @override
  Color get textIconInverse => const Color(0xFFFFFFFF);

  @override
  Color get textIconPrimaryDefault => const Color(0xFF986078);
  @override
  Color get textIconPrimaryExtra => const Color(0xFF70465A);

  @override
  Color get textIconSecondaryDefault => const Color(0xFF79639F);
  @override
  Color get textIconSecondaryExtra => const Color(0xFF594879);

  @override
  Color get textIconSuccess => const Color(0xFF65774C);
  @override
  Color get textIconWarning => const Color(0xFF96713D);
  @override
  Color get textIconCritical => const Color(0xFFAD526D);

  // Surface
  @override
  Color get surfaceDefault => const Color(0xFFFAF7F9);
  @override
  Color get surfaceInverse => const Color(0xFF342D38);

  @override
  Color get surfacePrimaryDefault => const Color(0xFFEBC5D2);
  @override
  Color get surfaceSecondaryDefault => const Color(0xFFD2C5EA);

  @override
  Color get surfaceSuccess => const Color(0xFFE1E9D5);
  @override
  Color get surfaceWarning => const Color(0xFFF5E8CD);
  @override
  Color get surfaceCritical => const Color(0xFFF2D9E1);
}

class DarkColors implements ThemeColors {
  const DarkColors();

  @override
  Color get transparent => Colors.transparent;

  @override
  Color get white => const Color(0xFFFFFFFF);
  @override
  Color get black => const Color(0xFF000000);

  // Text & Icon
  @override
  Color get textIconDefault => const Color(0xFFF5EFF7);
  @override
  Color get textIconInverse => const Color(0xFF342D38);

  @override
  Color get textIconPrimaryDefault => const Color(0xFFEBC5D2);
  @override
  Color get textIconPrimaryExtra => const Color(0xFF70465A);

  @override
  Color get textIconSecondaryDefault => const Color(0xFFD2C5EA);
  @override
  Color get textIconSecondaryExtra => const Color(0xFF594879);

  @override
  Color get textIconSuccess => const Color(0xFFB9D09D);
  @override
  Color get textIconWarning => const Color(0xFFF0CE91);
  @override
  Color get textIconCritical => const Color(0xFFEDADC2);

  // Surface
  @override
  Color get surfaceDefault => const Color(0xFF1E1A24);
  @override
  Color get surfaceInverse => const Color(0xFFF5EFF7);

  @override
  Color get surfacePrimaryDefault => const Color(0xFFEBC5D2);
  @override
  Color get surfaceSecondaryDefault => const Color(0xFFD2C5EA);

  @override
  Color get surfaceSuccess => const Color(0xFF35402F);
  @override
  Color get surfaceWarning => const Color(0xFF463A2B);
  @override
  Color get surfaceCritical => const Color(0xFF472E39);
}
