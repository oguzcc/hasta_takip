import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

sealed class AppPadding {
  static final baseScaffoldPadding = _PaddingConstant.allHalf();
  static final defaultColumnPadding = _PaddingConstant.all();

  static final defaultPagePadding = _PaddingConstant.defaultPagePadding();

  static final modalPadding = _PaddingConstant.symmetricHorizontal();
  static final dotIndicator = _PaddingConstant.symmetricVertical();

  static final btn = _PaddingConstant.btn();
  static final btnIcon = _PaddingConstant.btnIcon();
  static final input = _PaddingConstant.input();
  static final chip = _PaddingConstant.chip();
}

final class _PaddingConstant extends EdgeInsets {
  _PaddingConstant.all() : super.all(_normalValue.w);
  _PaddingConstant.allHalf() : super.all(_normalValue.w / 2);
  _PaddingConstant.defaultPagePadding()
      : super.symmetric(horizontal: _normalValue.w, vertical: 24.h);

  _PaddingConstant.symmetricHorizontal()
      : super.symmetric(horizontal: _normalValue.w);
  _PaddingConstant.symmetricVertical() : super.symmetric(vertical: 10.h);

  _PaddingConstant.btn() : super.symmetric(horizontal: 12.w, vertical: 12.h);
  _PaddingConstant.btnIcon()
      : super.symmetric(horizontal: 12.w, vertical: 12.h);
  _PaddingConstant.input() : super.symmetric(horizontal: 16.w, vertical: 16.h);
  _PaddingConstant.chip() : super.symmetric(horizontal: 12.w, vertical: 12.h);

  static const double _normalValue = 16;
}
