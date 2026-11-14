import 'package:flutter/material.dart';
import 'package:qwys/core/core.dart';

enum AppContainerColor {
  def,
  inv,
  primary,
  secondary,
  success,
  warning,
  critical,
}

class AppContainer extends StatelessWidget {
  const AppContainer({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(12),
    this.containerColor = AppContainerColor.def,
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
  });

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsets padding;
  final AppContainerColor containerColor;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _getBackGroundColor(context),
      borderRadius: borderRadius,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: padding,
          child: SizedBox(
            width: double.infinity,
            child: child,
          ),
        ),
      ),
    );
  }

  Color _getBackGroundColor(BuildContext context) {
    final colors = Theme.of(context).colors;

    return switch (containerColor) {
      AppContainerColor.def => colors.surfaceDefault,
      AppContainerColor.inv => colors.surfaceInverse,
      AppContainerColor.primary => colors.surfacePrimaryDefault,
      AppContainerColor.secondary => colors.surfaceSecondaryDefault,
      AppContainerColor.success => colors.surfaceSuccess,
      AppContainerColor.warning => colors.surfaceWarning,
      AppContainerColor.critical => colors.surfaceCritical,
    };
  }
}
