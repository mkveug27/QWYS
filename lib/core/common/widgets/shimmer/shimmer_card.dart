import 'package:flutter/material.dart';
import 'package:qwys/core/core.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  const AppShimmer({
    super.key,
    required this.child,
    this.isLoading = true,
    this.baseColor,
    this.highlightColor,
    this.period = const Duration(milliseconds: 1500),
  });

  final Widget child;
  final bool isLoading;
  final Color? baseColor;
  final Color? highlightColor;
  final Duration period;

  @override
  Widget build(BuildContext context) {
    if (!isLoading) return child;

    final colors = Theme.of(context).colors;

    return Shimmer.fromColors(
      baseColor: baseColor ?? colors.surfaceSecondaryDefault,
      highlightColor: highlightColor ?? colors.surfaceDefault,
      period: period,
      child: child,
    );
  }
}
