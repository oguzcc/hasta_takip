import 'package:flutter/material.dart';

import '../../style/app_colors.dart';
import '../../style/ny_icons.dart';

class Avatar extends StatelessWidget {
//size:64 r:32
  const Avatar.logo({
    this.image,
    super.key,
    this.radius = 32,
  });
//size:48 r:24
  const Avatar.waiter({
    this.image,
    super.key,
    this.radius = 24,
  });
//size:32 r:16
  const Avatar.medium({
    this.image,
    super.key,
    this.radius = 32,
  });
//size:120 r:60
  const Avatar.large({
    this.image,
    super.key,
    this.radius = 60,
  });

  final double radius;
  final NetworkImage? image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: context.color.backgroundBaseLightSecondary,
      foregroundImage: image,
      child: Icon(NyIcons.qr, color: context.color.labelLightTeartly, size: 32),
    );
  }
}
