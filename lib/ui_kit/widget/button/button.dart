// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/util/extension/context_ext.dart';
import '../../style/app_colors.dart';
import '../../style/app_padding.dart';
import '../../style/gap.dart';
import '../../style/ny_icons.dart';
import '../../theme/theme.dart';
import '../icon/svg_icon.dart';
import '../indicator/animate_switch.dart';
import '../indicator/loading_indicator.dart';

part '../icon/_password_eye.dart';
part '_button/_button.dart';
part '_button/_calc_btn.dart';
part '_button/_icon_btn.dart';
part '_button/_nav_btn.dart';

class Button extends StatelessWidget {
  const Button._({required this.button});

  final Widget button;

  factory Button.filled({
    required VoidCallback? onPressed,
    required String title,
    VisualDensity? visualDensity,
  }) {
    return Button._(
      button: _BtnFilled(
        onPressed: onPressed,
        title: title,
        visualDensity: visualDensity,
      ),
    );
  }
  factory Button.filledIcon({
    required VoidCallback? onPressed,
    required String title,
    required Widget icon,
    VisualDensity? visualDensity,
  }) {
    return Button._(
      button: _BtnFilledIcon(
        onPressed: onPressed,
        visualDensity: visualDensity,
        title: title,
        icon: icon,
      ),
    );
  }
  factory Button.opacity({
    required VoidCallback? onPressed,
    required String title,
  }) {
    return Button._(
      button: _BtnOpacity(
        onPressed: onPressed,
        title: title,
      ),
    );
  }
  factory Button.opacityIcon({
    required VoidCallback? onPressed,
    required String title,
    required Widget icon,
    VisualDensity? visualDensity,
  }) {
    return Button._(
      button: _BtnOpacityIcon(
        onPressed: onPressed,
        visualDensity: visualDensity,
        title: title,
        icon: icon,
      ),
    );
  }
  factory Button.plainAppBar({
    required VoidCallback? onPressed,
    required String title,
  }) {
    return Button._(
      button: _BtnPlainAppBar(
        onPressed: onPressed,
        title: title,
      ),
    );
  }
  factory Button.plain({
    required VoidCallback? onPressed,
    required String title,
  }) {
    return Button._(
      button: _BtnPlain(
        onPressed: onPressed,
        title: title,
      ),
    );
  }
  factory Button.plainIcon({
    required VoidCallback? onPressed,
    required String title,
    required Widget icon,
  }) {
    return Button._(
      button: _BtnPlainIcon(
        onPressed: onPressed,
        title: title,
        icon: icon,
      ),
    );
  }
  factory Button.plainSec({
    required VoidCallback? onPressed,
    required String title,
  }) {
    return Button._(
      button: _BtnPlainSec(
        onPressed: onPressed,
        title: title,
      ),
    );
  }
  factory Button.plainSecIcon({
    required VoidCallback? onPressed,
    required String title,
    required Widget icon,
  }) {
    return Button._(
      button: _BtnPlainSecIcon(
        onPressed: onPressed,
        title: title,
        icon: icon,
      ),
    );
  }
  factory Button.cancel({
    required VoidCallback? onPressed,
    required String title,
    bool? isRed,
  }) {
    return Button._(
      button: _BtnFilledCancel(
        onPressed: onPressed,
        title: title,
        isRed: isRed,
      ),
    );
  }
  factory Button.order({
    required VoidCallback onPressed,
    required String left,
    required String center,
    required String right,
    required bool isLoading,
  }) {
    return Button._(
      button: _BtnOrder(
        onPressed: onPressed,
        left: left,
        center: center,
        right: right,
        isLoading: isLoading,
      ),
    );
  }

  factory Button.navBack({VoidCallback? onTap, bool? isDark}) {
    return Button._(button: _NavBtn.back(onTap: onTap, isDark: isDark));
  }
  factory Button.navCross({VoidCallback? onTap, bool? isDark}) {
    return Button._(button: _NavBtn.cross(onTap: onTap, isDark: isDark));
  }
  factory Button.navShare({VoidCallback? onTap, bool? isDark}) {
    return Button._(button: _NavBtn.share(onTap: onTap, isDark: isDark));
  }
  factory Button.navInfo({VoidCallback? onTap, bool? isDark}) {
    return Button._(button: _NavBtn.info(onTap: onTap, isDark: isDark));
  }
  factory Button.navLikeOutlined({VoidCallback? onTap, bool? isDark}) {
    return Button._(button: _NavBtn.likeOutlined(onTap: onTap, isDark: isDark));
  }
  factory Button.navReboot({VoidCallback? onTap, bool? isDark}) {
    return Button._(button: _NavBtn.reboot(onTap: onTap, isDark: isDark));
  }
  factory Button.like({VoidCallback? onTap, double? size, double? iconSize}) {
    return Button._(
      button: _IconBtn.like(onTap: onTap, size: size, iconSize: iconSize),
    );
  }
  factory Button.cross({VoidCallback? onTap, double? size, double? iconSize}) {
    return Button._(
      button: _IconBtn.cross(onTap: onTap, size: size, iconSize: iconSize),
    );
  }

  factory Button.calcSM({bool? isDisabled}) {
    return Button._(
      button: _CalcBtn.small(
        isDisabled: isDisabled ?? false,
      ),
    );
  }
  factory Button.calcMD({bool? isDisabled}) {
    return Button._(
      button: _CalcBtn.medium(
        isDisabled: isDisabled ?? false,
      ),
    );
  }
  factory Button.calcLG({bool? isDisabled}) {
    return Button._(
      button: _CalcBtn.large(
        isDisabled: isDisabled ?? false,
      ),
    );
  }

  factory Button.radio() {
    return const Button._(
      button: _BtnRadio(),
    );
  }

  factory Button.passwordEye({
    required bool obscureText,
    required VoidCallback changeObscure,
  }) {
    return Button._(
      button: _PasswordEye(
        obscureText: obscureText,
        changeObscure: changeObscure,
      ),
    );
  }

  factory Button.apple() {
    return const Button._(button: _AppleButton());
  }
  factory Button.google() {
    return const Button._(button: _GoogleButton());
  }
  factory Button.facebook() {
    return const Button._(button: _FacebookButton());
  }

  @override
  Widget build(BuildContext context) {
    return button;
  }
}

extension ButtonModifier on Button {
  //full width
  Widget fullWidth() {
    return SizedBox(
      width: double.infinity,
      child: this,
    );
  }

  //expanded
  Widget expanded() {
    return Expanded(child: this);
  }

  //padding all
  Widget horMargin() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: this,
    );
  }
}
