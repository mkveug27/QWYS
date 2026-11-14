import 'package:flutter/material.dart';
import 'package:qwys/core/core.dart';

enum IconButtonSize { large, medium, small }

enum IconButtonColor { def, inv, primary, secondary }

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.buttonSize = IconButtonSize.medium,
    this.buttonColor = IconButtonColor.primary,
    this.disabled = false,
  });

  final VoidCallback onTap;
  final IconData icon;
  final IconButtonSize buttonSize;
  final IconButtonColor buttonColor;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colors;

    final size = _IconButtonSizeConfig.from(buttonSize);
    final color = _IconButtonColorConfig.from(context, buttonColor);

    return SizedBox.square(
      dimension: size.dimension,
      child: IconButton(
        onPressed: disabled ? null : onTap,
        icon: Icon(icon),
        iconSize: size.iconSize,
        style: IconButton.styleFrom(
          minimumSize: Size.square(size.dimension),
          maximumSize: Size.square(size.dimension),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size.radius),
          ),
          foregroundColor: color.foreground,
          backgroundColor: color.background,
          disabledBackgroundColor: colors.surfaceDefault,
          disabledForegroundColor: colors.textIconSecondaryDefault,
          shadowColor: colors.transparent,
          elevation: 0,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}

class _IconButtonSizeConfig {
  const _IconButtonSizeConfig({
    required this.dimension,
    required this.radius,
    required this.iconSize,
  });

  final double dimension;
  final double radius;
  final double iconSize;

  factory _IconButtonSizeConfig.from(IconButtonSize size) {
    return switch (size) {
      IconButtonSize.large => const _IconButtonSizeConfig(
          dimension: 50,
          radius: 20,
          iconSize: 40,
        ),
      IconButtonSize.medium => const _IconButtonSizeConfig(
          dimension: 40,
          radius: 16,
          iconSize: 24,
        ),
      IconButtonSize.small => const _IconButtonSizeConfig(
          dimension: 30,
          radius: 12,
          iconSize: 16,
        ),
    };
  }
}

class _IconButtonColorConfig {
  const _IconButtonColorConfig({
    required this.background,
    required this.foreground,
  });

  final Color background;
  final Color foreground;

  factory _IconButtonColorConfig.from(
    BuildContext context,
    IconButtonColor color,
  ) {
    final colors = Theme.of(context).colors;

    return switch (color) {
      IconButtonColor.def => _IconButtonColorConfig(
          background: colors.surfaceDefault,
          foreground: colors.textIconDefault,
        ),
      IconButtonColor.inv => _IconButtonColorConfig(
          background: colors.surfaceInverse,
          foreground: colors.textIconInverse,
        ),
      IconButtonColor.primary => _IconButtonColorConfig(
          background: colors.surfacePrimaryDefault,
          foreground: colors.textIconPrimaryExtra,
        ),
      IconButtonColor.secondary => _IconButtonColorConfig(
          background: colors.surfaceSecondaryDefault,
          foreground: colors.textIconSecondaryExtra,
        ),
    };
  }
}
