import 'package:flutter/material.dart';

import 'package:qwys/core/core.dart';
import 'package:qwys/core/i18n/strings.g.dart';

class AppEmpty extends StatelessWidget {
  const AppEmpty({
    super.key,
    this.icon,
    this.text,
    this.onPressed,
    this.buttonText,
    this.isScrollable = true,
    this.padding,
  });

  final IconData? icon;
  final String? text;
  final VoidCallback? onPressed;
  final String? buttonText;
  final bool isScrollable;
  final EdgeInsets? padding;

  static const double _iconSize = 100;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isScrollable
          ? CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: padding ?? EdgeInsets.all(mPadding),
                    child: Center(
                      child: _buildContent(context),
                    ),
                  ),
                ),
              ],
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
              icon ?? ThemeIcons.squareDashedMinus,
              size: _iconSize,
            ),
            Text(
              text ?? t.other.empty,
              style: textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        if (onPressed != null && buttonText != null)
          AppButton(
            onPressed: onPressed!,
            title: Text(buttonText!),
            buttonColor: ButtonColor.inv,
            fullWidth: false,
          ),
      ],
    );
  }
}
