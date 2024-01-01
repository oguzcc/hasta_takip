import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../text/txt.dart';
import 'svg_icon.dart';

class MapIcon extends StatelessWidget {
  const MapIcon._({required this.icon});

  factory MapIcon.greyBig(BuildContext context, {required String content}) {
    return MapIcon._(
      icon: _PinGrey(
        48.w,
        SizedBox.square(
          dimension: 48.w,
          child: SvgIcon.pinGreyBig(),
        ),
        Txt.pinBig(context, content),
      ),
    );
  }
  factory MapIcon.greySM(BuildContext context, {required String content}) {
    return MapIcon._(
      icon: _PinGrey(
        24.w,
        SvgIcon.pinGreySm(),
        Txt.pinSM(context, content),
      ),
    );
  }

  factory MapIcon.greenBig() => MapIcon._(icon: SvgIcon.pinGreenBig());
  factory MapIcon.greenSM() => MapIcon._(icon: SvgIcon.pinGreenSm());
  factory MapIcon.whiteBig() => MapIcon._(icon: SvgIcon.pinWhiteBig());
  factory MapIcon.whiteSM() => MapIcon._(icon: SvgIcon.pinWhiteSm());

  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return icon;
  }
}

class _PinGrey extends StatelessWidget {
  const _PinGrey(
    this.dimension,
    this.icon,
    this.content,
  );

  final double dimension;
  final Widget icon;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        icon,
        Positioned(
          top: 11.w,
          left: 5.w,
          right: 5.w,
          bottom: 17.w,
          child: SizedBox(
            width: 38.w,
            height: 20.h,
            child: content,
          ),
        ),
      ],
    );
  }
}
