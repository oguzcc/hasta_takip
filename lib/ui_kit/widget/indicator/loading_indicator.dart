import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../style/app_colors.dart';

class LoadingIndicator extends StatefulWidget {
  const LoadingIndicator({
    required this.alignment,
    required this.color,
    super.key,
  });

  const LoadingIndicator.bottom({
    this.alignment = Alignment.bottomCenter,
    this.color = Colors.white,
    super.key,
  });

  const LoadingIndicator.center({
    this.alignment = Alignment.center,
    this.color = AppColors.labelMintPrimary,
    super.key,
  });

  final AlignmentGeometry alignment;
  final Color color;

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.alignment,
      child: AnimatedBuilder(
        animation: _animation,
        child: CustomPaint(
          painter: CircleLoadingPainter(
            color: widget.color,
          ),
          child: SizedBox(
            width: 32.r,
            height: 32.r,
          ),
        ),
        builder: (context, child) {
          return Transform.rotate(
            angle: _animation.value * 2 * pi,
            child: child,
          );
        },
      ),
    );
  }
}

class CircleLoadingPainter extends CustomPainter {
  CircleLoadingPainter({
    required this.color,
  });

  final Color color;
  Rect rect = Rect.fromCircle(
    center: const Offset(32, 48),
    radius: 120,
  );
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..shader = RadialGradient(
        colors: [
          color,
          color.withOpacity(0.8),
          color.withOpacity(0.4),
          Colors.transparent,
          Colors.transparent,
        ],
        stops: const [0.0, 0.2, .3, .4, .6],
      ).createShader(rect);

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2) - paint.strokeWidth / 2;

    const startAngle = -pi / 2;
    const sweepAngle = pi * 1.2;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
