import 'package:flutter/material.dart';
import 'package:qwys/core/core.dart';
import 'package:shimmer/shimmer.dart';

class QuizzesShimmer extends StatelessWidget {
  const QuizzesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colors;

    return Shimmer.fromColors(
      baseColor: colors.surfaceSecondaryDefault,
      highlightColor: colors.surfaceDefault,
      period: const Duration(milliseconds: 1400),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(sPadding),
        itemCount: 5,
        itemBuilder: (_, __) => ShimmerCard(
          height: 225,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        separatorBuilder: (_, __) => 16.ph,
      ),
    );
  }
}
