import 'package:flutter/material.dart';
import 'package:qwys/core/core.dart';

enum ButtonSize { large, medium, small }

enum ButtonColor { def, inv, primary, secondary }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.icon,
    this.iconAlignment = IconAlignment.start,
    this.buttonSize = ButtonSize.large,
    this.buttonColor = ButtonColor.primary,
    this.disabled = false,
    this.loading = false,
    this.fullWidth = true,
  });

  final VoidCallback onPressed;
  final Widget title;
  final IconData? icon;
  final IconAlignment iconAlignment;
  final ButtonSize buttonSize;
  final ButtonColor buttonColor;
  final bool disabled;
  final bool loading;
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colors;

    final size = _ButtonSizeConfig.from(context, buttonSize);
    final color = _ButtonColorConfig.from(context, buttonColor);

    final isDisabled = disabled || loading;

    return SizedBox(
      width: fullWidth ? double.infinity : null,
      height: size.height,
      child: ElevatedButton.icon(
        onPressed: isDisabled ? null : onPressed,
        icon: _buildIcon(size),
        label: _buildLabel(color.foreground),
        iconAlignment: iconAlignment,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: lPadding,
            vertical: zeroPadding,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size.radius),
          ),
          elevation: 0,
          shadowColor: colors.transparent,
          backgroundColor: color.background,
          foregroundColor: color.foreground,
          disabledBackgroundColor: colors.surfaceDefault,
          disabledForegroundColor: colors.textIconSecondaryDefault,
          textStyle: size.textStyle.copyWith(height: 1),
        ),
      ),
    );
  }

  Widget? _buildIcon(_ButtonSizeConfig size) {
    if (icon == null || loading) return null;

    return Icon(
      icon,
      size: size.iconSize,
    );
  }

  Widget _buildLabel(Color foreground) {
    if (!loading) return title;

    return AppProgressIndicator(
      size: 20,
      strokeWidth: 2,
      color: foreground,
    );
  }
}

class _ButtonSizeConfig {
  const _ButtonSizeConfig({
    required this.height,
    required this.radius,
    required this.iconSize,
    required this.textStyle,
  });

  final double height;
  final double radius;
  final double iconSize;
  final TextStyle textStyle;

  factory _ButtonSizeConfig.from(
    BuildContext context,
    ButtonSize size,
  ) {
    final textTheme = Theme.of(context).textTheme;

    return switch (size) {
      ButtonSize.large => _ButtonSizeConfig(
          height: 52,
          radius: 20,
          iconSize: 24,
          textStyle: textTheme.titleSmall!,
        ),
      ButtonSize.medium => _ButtonSizeConfig(
          height: 44,
          radius: 16,
          iconSize: 20,
          textStyle: textTheme.titleMedium!,
        ),
      ButtonSize.small => _ButtonSizeConfig(
          height: 36,
          radius: 12,
          iconSize: 16,
          textStyle: textTheme.titleLarge!,
        ),
    };
  }
}

class _ButtonColorConfig {
  const _ButtonColorConfig({
    required this.background,
    required this.foreground,
  });

  final Color background;
  final Color foreground;

  factory _ButtonColorConfig.from(
    BuildContext context,
    ButtonColor color,
  ) {
    final colors = Theme.of(context).colors;

    return switch (color) {
      ButtonColor.def => _ButtonColorConfig(
          background: colors.surfaceDefault,
          foreground: colors.textIconDefault,
        ),
      ButtonColor.inv => _ButtonColorConfig(
          background: colors.surfaceInverse,
          foreground: colors.textIconInverse,
        ),
      ButtonColor.primary => _ButtonColorConfig(
          background: colors.surfacePrimaryDefault,
          foreground: colors.textIconPrimaryExtra,
        ),
      ButtonColor.secondary => _ButtonColorConfig(
          background: colors.surfaceSecondaryDefault,
          foreground: colors.textIconSecondaryExtra,
        ),
    };
  }
}
