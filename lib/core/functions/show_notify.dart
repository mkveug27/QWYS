import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qwys/core/core.dart';

enum NotifyType { info, success, warning, critical }

void showNotify({
  required BuildContext context,
  required String message,
  NotifyType type = NotifyType.info,
  bool allowMultiple = true,
}) {
  final textTheme = Theme.of(context).textTheme;

  final color = _NotifyColorConfig.from(context, type);
  final toast = FToast()..init(context);

  if (!allowMultiple) {
    toast.removeCustomToast();
  }

  toast.showToast(
    gravity: ToastGravity.TOP,
    toastDuration: const Duration(seconds: 5),
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: mPadding,
        vertical: sPadding,
      ),
      decoration: BoxDecoration(
        color: color.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        message,
        style: textTheme.labelMedium?.copyWith(
          color: color.foreground,
        ),
      ),
    ),
  );
}

class _NotifyColorConfig {
  const _NotifyColorConfig({
    required this.background,
    required this.foreground,
  });

  final Color background;
  final Color foreground;

  factory _NotifyColorConfig.from(
    BuildContext context,
    NotifyType type,
  ) {
    final colors = Theme.of(context).colors;

    return switch (type) {
      NotifyType.info => _NotifyColorConfig(
          background: colors.surfacePrimaryDefault,
          foreground: colors.textIconPrimaryExtra,
        ),
      NotifyType.success => _NotifyColorConfig(
          background: colors.surfaceSuccess,
          foreground: colors.textIconSuccess,
        ),
      NotifyType.warning => _NotifyColorConfig(
          background: colors.surfaceWarning,
          foreground: colors.textIconWarning,
        ),
      NotifyType.critical => _NotifyColorConfig(
          background: colors.surfaceCritical,
          foreground: colors.textIconCritical,
        ),
    };
  }
}
