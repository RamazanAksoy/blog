import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeAnimation(this.delay, this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    final MovieTween tween = MovieTween()
      ..scene(begin: const Duration(milliseconds: 0), end: const Duration(milliseconds: 500)).tween('opacity', Tween(begin: 0.0, end: 1.0))
      ..scene(begin: const Duration(milliseconds: 0), end: const Duration(milliseconds: 600)).tween('translateY', Tween(begin: -30.0, end: 0.0));

    return PlayAnimationBuilder<Movie>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (BuildContext context, value, Widget? child) {
        return Opacity(opacity: value.get('opacity'), child: Transform.translate(offset: Offset(0, value.get("translateY")), child: child));
      },
    );
  }
}
