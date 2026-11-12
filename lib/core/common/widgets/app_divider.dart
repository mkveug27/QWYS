import 'package:flutter/material.dart';

import 'package:qwys/core/extensions/theme_extension.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
    this.height = 1,
    this.thickness = 1,
    this.indent,
    this.endIndent,
    this.color,
  });

  final double height;
  final double thickness;
  final double? indent;
  final double? endIndent;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colors;

    return Divider(
      height: height,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
      color: color ?? colors.textIconDefault.withValues(alpha: 0.1),
    );
  }
}
