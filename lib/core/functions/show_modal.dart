import 'package:flutter/material.dart';

Future<void> showModal<T>({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
  ValueChanged<T>? onComplete,
}) async {
  final result = await showModalBottomSheet<T>(
    context: context,
    builder: builder,
    useRootNavigator: true,
    isScrollControlled: true,
    useSafeArea: true,
    enableDrag: true,
    scrollControlDisabledMaxHeightRatio: 1,
  );

  if (result == null || onComplete == null) return;

  await Future.delayed(const Duration(milliseconds: 300));
  onComplete(result);
}
