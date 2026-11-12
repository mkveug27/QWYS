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
  final colors = Theme.of(context).colors;
  final textTheme = Theme.of(context).textTheme;
  final toast = FToast()..init(context);

  if (!allowMultiple) {
    toast.removeCustomToast();
  }

  final (backgroundColor, textColor) = switch (type) {
    NotifyType.info => (
        colors.surfacePrimaryDefault,
        colors.textIconPrimaryExtra,
      ),
    NotifyType.success => (
        colors.surfaceSuccess,
        colors.textIconSuccess,
      ),
    NotifyType.warning => (
        colors.surfaceWarning,
        colors.textIconWarning,
      ),
    NotifyType.critical => (
        colors.surfaceCritical,
        colors.textIconCritical,
      ),
  };

  toast.showToast(
    gravity: ToastGravity.TOP,
    toastDuration: const Duration(seconds: 5),
    child: Container(
      margin: EdgeInsets.all(mPadding),
      padding: EdgeInsets.symmetric(
        horizontal: sPadding,
        vertical: mPadding,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Text(
        message,
        style: textTheme.labelMedium?.copyWith(
          color: textColor,
        ),
      ),
    ),
  );
}
