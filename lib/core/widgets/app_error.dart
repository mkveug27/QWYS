import 'package:flutter/material.dart';

import 'package:qwys/core/core.dart';
import 'package:qwys/core/i18n/strings.g.dart';

class AppError extends StatelessWidget {
  const AppError({
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
              icon ?? ThemeIcons.circleWarning,
              size: _iconSize,
            ),
            Text(
              t.error.error_default,
              style: textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            if (text != null)
              Text(
                text!,
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
