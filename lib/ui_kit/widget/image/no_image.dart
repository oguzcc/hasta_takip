import 'package:flutter/material.dart';

import '../../style/ny_icons.dart';

class NoImage extends StatelessWidget {
  const NoImage({
    super.key,
    this.width,
    this.height,
    this.radius,
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
    this.iconSize,
  });

  final double? height;
  final double? width;
  final double? radius;
  final double? topLeft;
  final double? topRight;
  final double? bottomLeft;
  final double? bottomRight;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFFE3E3E3),
        borderRadius: radius == null
            ? BorderRadius.only(
                topLeft: Radius.circular(topLeft ?? 0),
                topRight: Radius.circular(topRight ?? 0),
                bottomLeft: Radius.circular(bottomLeft ?? 0),
                bottomRight: Radius.circular(bottomRight ?? 0),
              )
            : BorderRadius.all(Radius.circular(radius ?? 0)),
      ),
      child: SizedBox.square(
        dimension: iconSize,
        child: Icon(
          NyIcons.qr,
          color: const Color(0x571A282F),
          size: iconSize,
        ),
      ),
    );
  }
}
