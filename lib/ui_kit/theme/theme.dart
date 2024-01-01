import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/app_colors.dart';
import '../style/app_padding.dart';
import '../style/app_radius.dart';
import 'app_text_theme.dart';

part 'button_theme.dart';
part 'card_theme.dart';
part 'chip_theme.dart';
part 'input_theme.dart';

class AppTheme {
  static final lightTheme = ThemeData.light(
    useMaterial3: true,
  ).copyWith(
    extensions: <ThemeExtension<dynamic>>[
      const AppTextTheme.design(),
    ],
    colorScheme: lightColorScheme,
    appBarTheme: const AppBarTheme(centerTitle: true),
    filledButtonTheme: _filledButtonLightTheme,
    elevatedButtonTheme: _elevatedButtonLightTheme,
    textButtonTheme: _textButtonLightTheme,
    outlinedButtonTheme: _outlinedButtonLightTheme,
    chipTheme: ChipThemeData(
      backgroundColor: const Color(0xFFE0EFF0),
      labelPadding: EdgeInsets.zero,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      labelStyle: TextStyle(
        color: lightColorScheme.primary,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      shape: const StadiumBorder(),
      side: BorderSide.none,
    ),
    cardTheme: _cardLightTheme,
    bottomSheetTheme: _bottomSheetTheme,
    inputDecorationTheme: _inputDecorationTheme,
    iconTheme: const IconThemeData(
      color: AppColors.buttonsTextColorOpacityPrimary,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateColor.resolveWith(
          (states) => AppColors.buttonsTextColorOpacityPrimary,
        ),
      ),
    ),
  );

  static final darkTheme = ThemeData.dark(
    useMaterial3: true,
  ).copyWith(
    colorScheme: darkColorScheme,
    filledButtonTheme: _filledButtonDarkTheme,
    elevatedButtonTheme: _elevatedButtonDarkTheme,
    textButtonTheme: _textButtonDarkTheme,
    outlinedButtonTheme: _outlinedButtonDarkTheme,
  );
}

BottomSheetThemeData get _bottomSheetTheme => BottomSheetThemeData(
      modalBackgroundColor: Colors.white,
      modalBarrierColor: Colors.black.withOpacity(.75),
      dragHandleSize: const Size(40, 4),
      surfaceTintColor: Colors.white,
      dragHandleColor: const Color(0x54B8B8B8),
    );
