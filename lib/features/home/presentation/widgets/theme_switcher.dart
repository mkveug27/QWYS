import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qwys/core/core.dart';
import 'package:qwys/features/features.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({
    super.key,
    required this.selectedMode,
    required this.onChanged,
  });

  final AppThemeMode selectedMode;
  final ValueChanged<AppThemeMode> onChanged;

  static const _icons = {
    AppThemeMode.light: Icons.light_mode,
    AppThemeMode.dark: Icons.dark_mode,
    AppThemeMode.system: Icons.settings,
  };

  static const double _iconSize = 20;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colors;

    return CupertinoSlidingSegmentedControl<AppThemeMode>(
      groupValue: selectedMode,
      backgroundColor: colors.surfaceDefault,
      thumbColor: colors.surfaceInverse,
      children: {
        for (final entry in _icons.entries)
          entry.key: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: lPadding,
              vertical: sPadding,
            ),
            child: Icon(
              entry.value,
              size: _iconSize,
              color: selectedMode == entry.key
                  ? colors.textIconInverse
                  : colors.textIconDefault,
            ),
          ),
      },
      onValueChanged: (value) {
        if (value != null) onChanged(value);
      },
    );
  }
}
