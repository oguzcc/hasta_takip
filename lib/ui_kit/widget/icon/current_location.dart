import 'package:flutter/material.dart';

import '../../style/app_colors.dart';

class CurrentLocation extends StatelessWidget {
  const CurrentLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 12,
      backgroundColor: context.color.labelDarkPrimary,
      child: const CircleAvatar(
        radius: 6,
        backgroundColor: Color(0xFF0066FF),
      ),
    );
  }
}
