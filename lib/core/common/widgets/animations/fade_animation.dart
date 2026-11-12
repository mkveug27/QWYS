import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  const FadeAnimation({
    super.key,
    required this.child,
    this.delay = 0,
    this.begin = 10,
    this.end = 0,
    this.duration = const Duration(milliseconds: 500),
  });

  final Duration duration;
  final double delay;
  final double begin;
  final double end;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomAnimationBuilder<double>(
      delay: Duration(milliseconds: (duration.inMilliseconds * delay).round()),
      duration: duration,
      tween: Tween(begin: begin, end: end),
      curve: Curves.easeOut,
      child: child,
      builder: (context, value, child) {
        return Opacity(
          opacity: 1 - (value - end) / (begin - end),
          child: Transform.translate(
            offset: Offset(0, value),
            child: child,
          ),
        );
      },
    );
  }
}
