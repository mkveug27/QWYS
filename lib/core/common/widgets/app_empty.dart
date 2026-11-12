import 'package:flutter/material.dart';

import 'package:qwys/core/core.dart';
import 'package:qwys/core/i18n/strings.g.dart';

class AppEmpty extends StatelessWidget {
  const AppEmpty({
    super.key,
    this.icon = Icons.inbox_outlined,
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
              text ?? t.other.empty,
              style: textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        if (button != null) button!,
      ],
    );
  }
}
