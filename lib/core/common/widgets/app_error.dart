import 'package:flutter/material.dart';

import 'package:qwys/core/core.dart';
import 'package:qwys/core/i18n/strings.g.dart';

class AppError extends StatelessWidget {
  const AppError({
    super.key,
    this.icon = Icons.error_outline_outlined,
    this.text,
    this.button,
    this.isScrollable = true,
    this.padding,
  });

  final IconData icon;
  final String? text;
  final Widget? button;
  final bool isScrollable;
  final EdgeInsets? padding;

  static const double _iconSize = 100;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isScrollable
          ? SingleChildScrollView(
              padding: padding ?? EdgeInsets.all(mPadding),
              child: _buildContent(context),
            )
          : _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      spacing: lPadding,
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          spacing: sPadding,
          children: [
            Icon(
              icon,
              size: _iconSize,
            ),
            Text(
              text ?? t.error.error_default,
              style: textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        if (button != null) button!,
      ],
    );
  }
}
