import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:qwys/core/core.dart';
import 'package:qwys/core/i18n/strings.g.dart';

class LocaleSwitcher extends StatelessWidget {
  const LocaleSwitcher({
    super.key,
    required this.selectedLocale,
    required this.onChanged,
  });

  final AppLocale selectedLocale;
  final ValueChanged<AppLocale> onChanged;

  static const _labels = {
    AppLocale.en: 'EN',
    AppLocale.ru: 'RU',
  };

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colors;
    final textTheme = Theme.of(context).textTheme;

    return CupertinoSlidingSegmentedControl<AppLocale>(
      groupValue: selectedLocale,
      backgroundColor: colors.surfaceDefault,
      thumbColor: colors.surfaceInverse,
      children: {
        for (final entry in _labels.entries)
          entry.key: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: lPadding,
              vertical: sPadding,
            ),
            child: Text(
              entry.value,
              style: textTheme.labelLarge?.copyWith(
                color: selectedLocale == entry.key
                    ? colors.textIconInverse
                    : colors.textIconDefault,
              ),
            ),
          ),
      },
      onValueChanged: (value) {
        if (value != null) onChanged(value);
      },
    );
  }
}
