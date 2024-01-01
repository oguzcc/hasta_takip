import 'package:flutter/material.dart';

class AnimateSwitch extends StatelessWidget {
  const AnimateSwitch({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: kRadialReactionDuration,
      transitionBuilder: (child, animation) =>
          ScaleTransition(scale: animation, child: child),
      child: child,
    );
  }
}
