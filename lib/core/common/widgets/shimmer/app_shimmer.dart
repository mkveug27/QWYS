import 'package:flutter/material.dart';
import 'package:qwys/core/core.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({
    super.key,
    this.width = double.infinity,
    this.height = double.infinity,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.color,
    this.isShimmer = false,
  });

  final double width;
  final double height;
  final BorderRadiusGeometry borderRadius;
  final Color? color;
  final bool isShimmer;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colors;

    final child = Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? colors.surfaceSecondaryDefault,
        borderRadius: borderRadius,
      ),
    );

    if (!isShimmer) return child;

    return AppShimmer(child: child);
  }
}
