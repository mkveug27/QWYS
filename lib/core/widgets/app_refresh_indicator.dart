import 'package:flutter/material.dart';
import 'package:qwys/core/core.dart';

class AppRefreshIndicator extends StatelessWidget {
  const AppRefreshIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  final Widget child;
  final RefreshCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colors;

    return RefreshIndicator(
      onRefresh: onRefresh,
      backgroundColor: colors.surfaceDefault,
      child: child,
    );
  }
}
