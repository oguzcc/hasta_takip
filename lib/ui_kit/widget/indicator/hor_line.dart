import 'package:flutter/material.dart';

import '../../style/app_colors.dart';

class HorLine extends StatelessWidget {
  const HorLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: context.color.separatorColorLightNoTransparency,
    );
  }
}
