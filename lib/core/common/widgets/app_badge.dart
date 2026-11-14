import 'package:flutter/material.dart';
import 'package:qwys/core/core.dart';

enum BadgeSize { large, medium, small }

enum BadgeColor {
  def,
  inv,
  primary,
  secondary,
  success,
  warning,
  critical,
}

class AppBadge extends StatelessWidget {
  const AppBadge({
    super.key,
    this.title,
    this.icon,
    this.iconAlignment = IconAlignment.start,
    this.badgeSize = BadgeSize.medium,
    this.badgeColor = BadgeColor.primary,
    this.borderRadius,
  });

  final String? title;
  final IconData? icon;
  final IconAlignment iconAlignment;
  final BadgeSize badgeSize;
  final BadgeColor badgeColor;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final size = _BadgeSizeConfig.from(context, badgeSize);
    final color = _BadgeColorConfig.from(context, badgeColor);

    return Container(
      padding: size.padding,
      decoration: BoxDecoration(
        color: color.background,
        borderRadius: borderRadius ?? BorderRadius.circular(size.radius),
      ),
      child: Row(
        spacing: xsPadding,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null && iconAlignment == IconAlignment.start)
            _buildIcon(size, color),
          if (title != null && title!.isNotEmpty)
            Flexible(
              child: Text(
                title!,
                style: size.textStyle.copyWith(
                  color: color.foreground,
                  height: 1,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          if (icon != null && iconAlignment == IconAlignment.end)
            _buildIcon(size, color),
        ],
      ),
    );
  }

  Widget _buildIcon(_BadgeSizeConfig size, _BadgeColorConfig color) {
    return Icon(
      icon,
      size: size.iconSize,
      color: color.foreground,
    );
  }
}

class _BadgeSizeConfig {
  const _BadgeSizeConfig({
    required this.padding,
    required this.radius,
    required this.iconSize,
    required this.textStyle,
  });

  final EdgeInsets padding;
  final double radius;
  final double iconSize;
  final TextStyle textStyle;

  factory _BadgeSizeConfig.from(
    BuildContext context,
    BadgeSize size,
  ) {
    final textTheme = Theme.of(context).textTheme;

    return switch (size) {
      BadgeSize.large => _BadgeSizeConfig(
          padding: const EdgeInsets.symmetric(
            horizontal: lPadding,
            vertical: sPadding,
          ),
          radius: 16,
          iconSize: 20,
          textStyle: textTheme.labelMedium!,
        ),
      BadgeSize.medium => _BadgeSizeConfig(
          padding: const EdgeInsets.symmetric(
            horizontal: mPadding,
            vertical: sPadding,
          ),
          radius: 14,
          iconSize: 18,
          textStyle: textTheme.labelSmall!,
        ),
      BadgeSize.small => _BadgeSizeConfig(
          padding: const EdgeInsets.symmetric(
            horizontal: sPadding,
            vertical: xsPadding,
          ),
          radius: 12,
          iconSize: 16,
          textStyle: textTheme.labelSmall!,
        ),
    };
  }
}

class _BadgeColorConfig {
  const _BadgeColorConfig({
    required this.background,
    required this.foreground,
  });

  final Color background;
  final Color foreground;

  factory _BadgeColorConfig.from(
    BuildContext context,
    BadgeColor color,
  ) {
    final colors = Theme.of(context).colors;

    return switch (color) {
      BadgeColor.def => _BadgeColorConfig(
          background: colors.surfaceDefault,
          foreground: colors.textIconDefault,
        ),
      BadgeColor.inv => _BadgeColorConfig(
          background: colors.surfaceInverse,
          foreground: colors.textIconInverse,
        ),
      BadgeColor.primary => _BadgeColorConfig(
          background: colors.surfacePrimaryDefault,
          foreground: colors.textIconPrimaryExtra,
        ),
      BadgeColor.secondary => _BadgeColorConfig(
          background: colors.surfaceSecondaryDefault,
          foreground: colors.textIconSecondaryExtra,
        ),
      BadgeColor.success => _BadgeColorConfig(
          background: colors.surfaceSuccess,
          foreground: colors.textIconSuccess,
        ),
      BadgeColor.warning => _BadgeColorConfig(
          background: colors.surfaceWarning,
          foreground: colors.textIconWarning,
        ),
      BadgeColor.critical => _BadgeColorConfig(
          background: colors.surfaceCritical,
          foreground: colors.textIconCritical,
        ),
    };
  }
}
