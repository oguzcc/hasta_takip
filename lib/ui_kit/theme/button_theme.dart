part of 'theme.dart';

FilledButtonThemeData get _filledButtonLightTheme =>
    FilledButtonThemeData(style: style(btnColors(filledColors)));
FilledButtonThemeData get _filledButtonDarkTheme =>
    FilledButtonThemeData(style: style(btnColors(filledColors, isDark: true)));

ElevatedButtonThemeData get _elevatedButtonLightTheme =>
    ElevatedButtonThemeData(style: style(btnColors(opacityColors)));
ElevatedButtonThemeData get _elevatedButtonDarkTheme => ElevatedButtonThemeData(
      style: style(btnColors(opacityColors, isDark: true)),
    );

TextButtonThemeData get _textButtonLightTheme =>
    TextButtonThemeData(style: style(btnColors(plainColors)));
TextButtonThemeData get _textButtonDarkTheme =>
    TextButtonThemeData(style: style(btnColors(plainColors, isDark: true)));

OutlinedButtonThemeData get _outlinedButtonLightTheme =>
    OutlinedButtonThemeData(style: style(btnColors(outlinedColors)));
OutlinedButtonThemeData get _outlinedButtonDarkTheme => OutlinedButtonThemeData(
      style: style(btnColors(outlinedColors, isDark: true)),
    );

// opacity 100% ff // 95% f2 // 90% e6 // 80% cc // 70% b3 // 60% 99
// 50% 80 // 40% 66 // 30% 4d // 12% 1f // 10% 1a // 5% 0d // 0% 00

Map<String, Color> get filledColors => {
      'fg': const Color(0xffffffff),
      'fgPress': const Color(0xffffffff),
      'fgDis': const Color(0xffffffff),
      'bg': const Color(0xff038189),
      'bgPress': const Color(0xff015E64),
      'bgDis': const Color(0x66038189),
      'fgDark': const Color(0xff038189),
      'fgPressDark': const Color(0xff038189),
      'fgDisDark': const Color(0x66038189),
      'bgDark': const Color(0xffffffff),
      'bgPressDark': const Color(0xccffffff),
      'bgDisDark': const Color(0x66ffffff),
    };

Map<String, Color> get opacityColors => {
      'fg': const Color(0xff038189),
      'fgPress': const Color(0xff038189),
      'fgDis': const Color(0x66038189),
      'bg': const Color(0x1f038189),
      'bgPress': const Color(0x4d038189),
      'bgDis': const Color(0x1f038189),
      'fgDark': const Color(0xffffffff),
      'fgPressDark': const Color(0xffffffff),
      'fgDisDark': const Color(0x66ffffff),
      'bgDark': const Color(0x1fffffff),
      'bgPressDark': const Color(0x4dffffff),
      'bgDisDark': const Color(0x1fffffff),
    };

Map<String, Color> get plainColors => {
      'fg': const Color(0xff038189),
      'fgPress': const Color(0xff015E64),
      'fgDis': const Color(0x66ffffff),
      'bg': Colors.transparent,
      'bgPress': Colors.transparent,
      'bgDis': Colors.transparent,
      'fgDark': const Color(0xffffffff),
      'fgPressDark': const Color(0xccffffff),
      'fgDisDark': const Color(0x66038189),
      'bgDark': Colors.transparent,
      'bgPressDark': Colors.transparent,
      'bgDisDark': Colors.transparent,
    };

Map<String, Color> get plainSecColors => {
      'fg': const Color(0xff8C9397),
      'fgPress': const Color(0xff5D6265),
      'fgDis': const Color(0xff8C9397),
      'bg': Colors.transparent,
      'bgPress': Colors.transparent,
      'bgDis': Colors.transparent,
      'fgDark': const Color(0xffffffff),
      'fgPressDark': const Color(0xccffffff),
      'fgDisDark': const Color(0x66038189),
      'bgDark': Colors.transparent,
      'bgPressDark': Colors.transparent,
      'bgDisDark': Colors.transparent,
    };

Map<String, Color> get outlinedColors => {
      'fg': const Color(0x00000000),
      'fgPress': const Color(0x99000000),
      'fgDis': const Color(0x66000000),
      'bg': const Color(0xffffffff),
      'bgPress': const Color(0xffffffff),
      'bgDis': const Color(0x66ffffff),
      'fgDark': const Color(0x00000000),
      'fgPressDark': const Color(0x99000000),
      'fgDisDark': const Color(0x66000000),
      'bgDark': const Color(0xffffffff),
      'bgPressDark': const Color(0xffffffff),
      'bgDisDark': const Color(0x66ffffff),
    };

ButtonColors btnColors(Map<String, Color> colors, {bool isDark = false}) {
  return ButtonColors(
    fg: isDark ? colors['fgDark']! : colors['fg']!,
    fgPress: isDark ? colors['fgPressDark']! : colors['fgPress']!,
    fgDis: isDark ? colors['fgDisDark']! : colors['fgDis']!,
    bg: isDark ? colors['bgDark']! : colors['bg']!,
    bgPress: isDark ? colors['bgPressDark']! : colors['bgPress']!,
    bgDis: isDark ? colors['bgDisDark']! : colors['bgDis']!,
  );
}

ButtonStyle style(ButtonColors btn) {
  Color foreground(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) return btn.fgDis;
    if (states.contains(MaterialState.pressed)) return btn.fgPress;
    return btn.fg;
  }

  Color background(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) return btn.bgDis;
    if (states.contains(MaterialState.pressed)) return btn.bgPress;
    return btn.bg;
  }

  final foregroundColor = MaterialStateProperty.resolveWith<Color>(foreground);
  final backgroundColor = MaterialStateProperty.resolveWith<Color>(background);

  MaterialStateProperty<RoundedRectangleBorder> shape() =>
      MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: AppRadius.btn()),
      );

  MaterialStateProperty<EdgeInsetsGeometry> padding() =>
      MaterialStateProperty.all(
        AppPadding.btn,
      );

  MaterialStateProperty<TextStyle> textStyle() => MaterialStateProperty.all(
        const TextStyle(
          fontSize: 14,
          height: 20 / 14,
          letterSpacing: -0.24,
          fontFamily: 'SF-Pro-Text',
          fontWeight: FontWeight.w600,
        ),
      );

  return ButtonStyle(
    minimumSize: MaterialStateProperty.all(Size(0, 50.h)),
    maximumSize: MaterialStateProperty.all(Size(double.infinity, 50.h)),
    foregroundColor: foregroundColor,
    backgroundColor: backgroundColor,
    shape: shape(),
    padding: padding(),
    iconColor: foregroundColor,
    elevation: MaterialStateProperty.all(0),
    textStyle: textStyle(),
  );
}

class ButtonColors {
  ButtonColors({
    required this.fg,
    required this.fgPress,
    required this.fgDis,
    required this.bg,
    required this.bgPress,
    required this.bgDis,
  });

  final Color fg;
  final Color fgPress;
  final Color fgDis;
  final Color bg;
  final Color bgPress;
  final Color bgDis;
}
