// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../style/app_colors.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon(
    this.asset, {
    super.key,
    this.size,
    this.color,
    this.matchTextDirection,
  });

  const SvgIcon._(
    this.asset, {
    super.key,
    this.size,
    this.color,
    this.matchTextDirection,
  });

  factory SvgIcon.apple() => SvgIcon._(AssetConst.appleWhite);
  factory SvgIcon.facebook() => SvgIcon._(AssetConst.facebookWhite);
  factory SvgIcon.google() => SvgIcon._(
        AssetConst.googleFilled,
        color: Colors.transparent,
      );

  factory SvgIcon.warnFilledSM() => SvgIcon._(
        AssetConst.warnCircleFilled,
        size: 16.w,
        color: AppColors.systemColorRedLightPrimary,
      );
  factory SvgIcon.warnFilledLG() =>
      SvgIcon._(AssetConst.warnCircleFilled, size: 64.w);

  factory SvgIcon.pinGreenBig() => SvgIcon._(
        AssetConst.pinGreenBurgerLG,
        size: 48.w,
      );
  factory SvgIcon.pinGreenSm() => SvgIcon._(
        AssetConst.pinGreenBurgerSM,
        size: 24.w,
      );
  factory SvgIcon.pinWhiteBig() => SvgIcon._(
        AssetConst.pinWhiteBurgerLG,
        size: 48.w,
      );
  factory SvgIcon.pinWhiteSm() => SvgIcon._(
        AssetConst.pinWhiteBurgerSM,
        size: 24.w,
      );
  factory SvgIcon.pinGreyBig() => SvgIcon._(
        AssetConst.pinGreyTextLG,
        size: 48.w,
      );
  factory SvgIcon.pinGreySm() => SvgIcon._(
        AssetConst.pinGreyTextSM,
        size: 24.w,
      );

  factory SvgIcon.voucher({double? size}) => SvgIcon._(
        AssetConst.voucherFilled,
        size: size ?? 32.w,
      );
  factory SvgIcon.voucherGreen({double? size}) => SvgIcon._(
        AssetConst.voucherGreen,
        size: size ?? 24.w,
      );
  factory SvgIcon.gift({double? size}) => SvgIcon._(
        AssetConst.giftFilled,
        size: size ?? 32.w,
      );

  factory SvgIcon.passwordCheck() => SvgIcon._(
        AssetConst.checkCircleFilled,
        size: 16.w,
        color: AppColors.systemColorGreenLight,
      );
  factory SvgIcon.passwordDanger() => SvgIcon._(
        AssetConst.dangerCircleFilled,
        size: 16.w,
        color: AppColors.systemColorRedLightPrimary,
      );

  final String asset;
  final double? size;
  final Color? color;
  final bool? matchTextDirection;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      width: size ?? 24.w,
      height: size ?? 24.w,
      matchTextDirection: matchTextDirection ?? false,
      colorFilter: ColorFilter.mode(
        color ?? Colors.transparent,
        BlendMode.srcATop,
      ),
    );
  }
}

sealed class AssetConst {
  static final beardMan = 'beard'.toAvatar;
  static final whiteMan = 'white'.toAvatar;

  static final checkCircleFilled = 'check_circle_filled'.toProcess;
  static final dangerCircleFilled = 'danger_circle_filled'.toProcess;
  static final warnCircleFilled = 'warn_circle_filled'.toProcess;
  static final warnCircleOutlined = 'warn_circle_outlined'.toProcess;

  static final restaurantFilled = 'restaurant_filled'.toRestaurant;
  static final voucherFilled = 'voucher_filled'.toRestaurant;
  static final voucherGreen = 'voucher_green'.toRestaurant;
  static final giftFilled = 'gift_filled'.toRestaurant;

  static final appleFilled = 'apple_filled'.toSocial;
  static final appleWhite = 'apple_white'.toSocial;
  static final facebookFilled = 'facebook_filled'.toSocial;
  static final facebookWhite = 'facebook_white'.toSocial;
  static final googleFilled = 'google_filled'.toSocial;
  static final googleWhite = 'google_white'.toSocial;

  static final bgNotification = 'bg_notification'.toBg;
  static final bgWalkDistance = 'bg_walk_distance'.toBg;

  static final pinGreenBurgerSM = 'pin_green_burger_sm'.toMap;
  static final pinGreenBurgerLG = 'pin_green_burger_lg'.toMap;
  static final pinWhiteBurgerSM = 'pin_white_burger_sm'.toMap;
  static final pinWhiteBurgerLG = 'pin_white_burger_lg'.toMap;
  static final pinGreyTextSM = 'pin_grey_text_sm'.toMap;
  static final pinGreyTextLG = 'pin_grey_text_lg'.toMap;
}

extension _AssetConstExt on String {
  String get toAvatar => 'assets/image/avatar/$this.png';
  String get toMap => 'assets/svg/map/$this.svg';
  String get toNav => 'assets/svg/nav/$this.svg';
  String get toProcess => 'assets/svg/process/$this.svg';
  String get toRestaurant => 'assets/svg/restaurant/$this.svg';
  String get toSocial => 'assets/svg/social/$this.svg';
  String get toBg => 'assets/svg/bg/$this.svg';
}
