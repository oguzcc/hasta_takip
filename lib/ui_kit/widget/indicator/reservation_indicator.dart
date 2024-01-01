import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReservationIndicator extends StatelessWidget {
  const ReservationIndicator({required this.color, super.key});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color.withOpacity(0.25),
      radius: 12.r,
      child: CircleAvatar(
        backgroundColor: color.withOpacity(0.4),
        radius: 7.r,
        child: CircleAvatar(
          backgroundColor: color.withOpacity(0.8),
          radius: 3.r,
        ),
      ),
    );
  }
}
