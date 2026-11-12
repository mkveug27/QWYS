import 'package:flutter/material.dart';
import 'package:qwys/core/core.dart';

class AppModal extends StatelessWidget {
  const AppModal({
    super.key,
    this.title,
    this.subtitle,
    required this.child,
    this.padding,
    this.useSafeArea = true,
  });

  final String? title;
  final String? subtitle;
  final Widget child;
  final EdgeInsets? padding;
  final bool useSafeArea;

  @override
  Widget build(BuildContext context) {
    final content = _buildContent(context);

    return useSafeArea
        ? SafeArea(
            bottom: false,
            child: content,
          )
        : content;
  }

  Widget _buildContent(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom + mPadding,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null || subtitle != null)
            Padding(
              padding: const EdgeInsets.only(top: mPadding),
              child: Column(
                spacing: xsPadding,
                children: [
                  if (title != null)
                    Text(
                      title!,
                      textAlign: TextAlign.center,
                      style: textTheme.headlineSmall,
                    ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      textAlign: TextAlign.center,
                      style: textTheme.bodySmall,
                    ),
                ],
              ),
            ),
          SingleChildScrollView(
            padding: padding ?? EdgeInsets.all(mPadding),
            child: child,
          ),
        ],
      ),
    );
  }
}
