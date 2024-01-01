// ignore_for_file: library_private_types_in_public_api, unused_field

import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color background = Color(0xff000000);

  static const Color labelLightPrimary = Color(0xff1a282f);

  static const Color labelLightSecondary = Color(0x7f1a282f);

  static const Color labelLightTeartly = Color(0x561a282f);

  static const Color labelLightQuaternary = Color(0xffa5abad);

  static const Color labelDarkPrimary = Color(0xffffffff);

  static const Color labelDarkSecondary = Color(0x99ffffff);

  static const Color labelMintPrimary = Color(0xff038189);

  static const Color buttonsBgColorFilledDefault = Color(0xff038189);

  static const Color buttonsBgColorFilledPressed = Color(0xff015d63);

  static const Color buttonsBgColorOpacityDefault = Color(0x1e038189);

  static const Color buttonsBgColorOpacityPressed = Color(0x4c038189);

  static const Color buttonsBgColorPlainPrimaryDefault = Color(0xff038189);

  static const Color buttonsBgColorPlainPrimaryPressed = Color(0xff015d63);

  static const Color buttonsBgColorPlainSecondaryDefault = Color(0xff8c9397);

  static const Color buttonsBgColorPlainSecondaryPressed = Color(0xff5d6264);

  static const Color buttonsTextColorFilledPrimary = Color(0xffffffff);

  static const Color buttonsTextColorOpacityPrimary = Color(0xff038189);

  static const Color systemColorMintPrimary = Color(0xff038189);

  static const Color systemColorMintSecondary = Color(0xffe0eff0);

  static const Color systemColorMintTeartly = Color(0xfff0f7f8);

  static const Color systemColorGrayLight = Color(0xff98a6af);

  static const Color systemColorGreenLight = Color(0xff34c759);

  static const Color systemColorGreenDark = Color(0xff30d158);

  static const Color systemColorRedLightPrimary = Color(0xffff3b30);

  static const Color systemColorRedLightSecondary = Color(0x26ff3b30);

  static const Color systemColorRedLightTeartly = Color(0x19ff3b30);

  static const Color systemColorRedDarkPrimary = Color(0xffff453a);

  static const Color systemColorOrangeLight = Color(0xffff9500);

  static const Color systemColorOrangeDark = Color(0xffff9f0a);

  static const Color systemColorYellowLight = Color(0xffffcc00);

  static const Color systemColorYellowDark = Color(0xffffd60a);

  static const Color fillColorLightPrimary = Color(0x753f3f3f);

  static const Color fillColorLightSecondary = Color(0x286b6b6b);

  static const Color fillColorLightTeartly = Color(0x1e9e9e9e);

  static const Color fillColorLightQuaternary = Color(0x149e9e9e);

  static const Color fillColorDarkPrimary = Color(0x4cffffff);

  static const Color separatorColorLightNoTransparency = Color(0xffe7e7e7);

  static const Color separatorColorLightWithTransparency = Color(0x54b8b8b8);

  static const Color separatorColorDarkNoTransparancy = Color(0xff474747);

  static const Color separatorColorDarkWithTransparancy = Color(0x33b8b8b8);

  static const Color backgroundBaseLightPrimary = Color(0xffffffff);

  static const Color backgroundBaseLightSecondary = Color(0xffe3e3e3);

  static const Color backgroundBaseDarkPrimary = Color(0xff038189);

  static const Color backgroundElevatedPrimary = Color(0xfff6f6f6);

  static const loadGrayLine =
      LinearGradient(colors: [Color(0xffe3e3e3), Color(0xffc6c6c6)]);

  //added by mshn
  static const Color defaultSystemBlueLight = Color(0xff007aff);
  static const Color defaultSystemRedLight = Color(0xffFF3B30);
}

extension ContextExtension on BuildContext {
  _ContextColorExtension get color => _ContextColorExtension(this);
}

class _ContextColorExtension {
  _ContextColorExtension(BuildContext context) : _context = context;
  final BuildContext _context;

  Color get background => AppColors.background;
  Color get labelLightPrimary => AppColors.labelLightPrimary;
  Color get labelLightSecondary => AppColors.labelLightSecondary;
  Color get labelLightTeartly => AppColors.labelLightTeartly;
  Color get labelLightQuaternary => AppColors.labelLightQuaternary;
  Color get labelDarkPrimary => AppColors.labelDarkPrimary;
  Color get labelDarkSecondary => AppColors.labelDarkSecondary;
  Color get labelMintPrimary => AppColors.labelMintPrimary;
  Color get buttonsBgColorFilledDefault =>
      AppColors.buttonsBgColorFilledDefault;
  Color get buttonsBgColorFilledPressed =>
      AppColors.buttonsBgColorFilledPressed;
  Color get buttonsBgColorOpacityDefault =>
      AppColors.buttonsBgColorOpacityDefault;
  Color get buttonsBgColorOpacityPressed =>
      AppColors.buttonsBgColorOpacityPressed;
  Color get buttonsBgColorPlainPrimaryDefault =>
      AppColors.buttonsBgColorPlainPrimaryDefault;
  Color get buttonsBgColorPlainPrimaryPressed =>
      AppColors.buttonsBgColorPlainPrimaryPressed;
  Color get buttonsBgColorPlainSecondaryDefault =>
      AppColors.buttonsBgColorPlainSecondaryDefault;
  Color get buttonsBgColorPlainSecondaryPressed =>
      AppColors.buttonsBgColorPlainSecondaryPressed;
  Color get buttonsTextColorFilledPrimary =>
      AppColors.buttonsTextColorFilledPrimary;
  Color get buttonsTextColorOpacityPrimary =>
      AppColors.buttonsTextColorOpacityPrimary;
  Color get systemColorMintPrimary => AppColors.systemColorMintPrimary;
  Color get systemColorMintSecondary => AppColors.systemColorMintSecondary;
  Color get systemColorMintTeartly => AppColors.systemColorMintTeartly;
  Color get systemColorGrayLight => AppColors.systemColorGrayLight;
  Color get systemColorGreenLight => AppColors.systemColorGreenLight;
  Color get systemColorGreenDark => AppColors.systemColorGreenDark;
  Color get systemColorRedLightPrimary => AppColors.systemColorRedLightPrimary;
  Color get systemColorRedLightSecondary =>
      AppColors.systemColorRedLightSecondary;
  Color get systemColorRedLightTeartly => AppColors.systemColorRedLightTeartly;
  Color get systemColorRedDarkPrimary => AppColors.systemColorRedDarkPrimary;
  Color get systemColorOrangeLight => AppColors.systemColorOrangeLight;
  Color get systemColorOrangeDark => AppColors.systemColorOrangeDark;
  Color get systemColorYellowLight => AppColors.systemColorYellowLight;
  Color get systemColorYellowDark => AppColors.systemColorYellowDark;
  Color get fillColorLightPrimary => AppColors.fillColorLightPrimary;
  Color get fillColorLightSecondary => AppColors.fillColorLightSecondary;
  Color get fillColorLightTeartly => AppColors.fillColorLightTeartly;
  Color get fillColorLightQuaternary => AppColors.fillColorLightQuaternary;
  Color get fillColorDarkPrimary => AppColors.fillColorDarkPrimary;
  Color get separatorColorLightNoTransparency =>
      AppColors.separatorColorLightNoTransparency;
  Color get separatorColorLightWithTransparency =>
      AppColors.separatorColorLightWithTransparency;
  Color get separatorColorDarkNoTransparancy =>
      AppColors.separatorColorDarkNoTransparancy;
  Color get separatorColorDarkWithTransparancy =>
      AppColors.separatorColorDarkWithTransparancy;
  Color get backgroundBaseLightPrimary => AppColors.backgroundBaseLightPrimary;
  Color get backgroundBaseLightSecondary =>
      AppColors.backgroundBaseLightSecondary;
  Color get backgroundBaseDarkPrimary => AppColors.backgroundBaseDarkPrimary;
  Color get backgroundElevatedPrimary => AppColors.backgroundElevatedPrimary;
  LinearGradient get loadGrayLine => AppColors.loadGrayLine;

  //added by mshn
  Color get defaultSystemBlueLight => AppColors.defaultSystemBlueLight;
  Color get defaultSystemRedLight => AppColors.defaultSystemRedLight;
}

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  // primary: Color(0xFF006970),
  primary: Color(0xFF038189),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFF7AF4FF),
  onPrimaryContainer: Color(0xFF002022),
  secondary: Color(0xFF4A6365),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFCCE8EA),
  onSecondaryContainer: Color(0xFF051F21),
  tertiary: Color(0xFF4F5F7D),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFD7E2FF),
  onTertiaryContainer: Color(0xFF0A1B36),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  // onErrorContainer: Color(0xFF410002),
  onErrorContainer: Color(0x1AFF3B30),
  background: Color(0xFFFAFDFC),
  onBackground: Color(0xFF191C1D),
  surface: Color(0xFFFAFDFC),
  onSurface: Color(0xFF191C1D),
  surfaceVariant: Color(0xFFDAE4E5),
  onSurfaceVariant: Color(0xFF3F4849),
  outline: Color(0xFF6F797A),
  onInverseSurface: Color(0xFFEFF1F1),
  inverseSurface: Color(0xFF2D3131),
  inversePrimary: Color(0xFF4DD9E4),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF006970),
  outlineVariant: Color(0xFFBEC8C9),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF4DD9E4),
  onPrimary: Color(0xFF00363A),
  primaryContainer: Color(0xFF004F54),
  onPrimaryContainer: Color(0xFF7AF4FF),
  secondary: Color(0xFFB1CBCE),
  onSecondary: Color(0xFF1B3437),
  secondaryContainer: Color(0xFF324B4D),
  onSecondaryContainer: Color(0xFFCCE8EA),
  tertiary: Color(0xFFB7C7EA),
  onTertiary: Color(0xFF21304C),
  tertiaryContainer: Color(0xFF384764),
  onTertiaryContainer: Color(0xFFD7E2FF),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF191C1D),
  onBackground: Color(0xFFE0E3E3),
  surface: Color(0xFF191C1D),
  onSurface: Color(0xFFE0E3E3),
  surfaceVariant: Color(0xFF3F4849),
  onSurfaceVariant: Color(0xFFBEC8C9),
  outline: Color(0xFF899393),
  onInverseSurface: Color(0xFF191C1D),
  inverseSurface: Color(0xFFE0E3E3),
  inversePrimary: Color(0xFF006970),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF4DD9E4),
  outlineVariant: Color(0xFF3F4849),
  scrim: Color(0xFF000000),
);
