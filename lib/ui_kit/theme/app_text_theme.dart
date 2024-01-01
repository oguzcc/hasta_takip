import 'package:flutter/material.dart';

@immutable
class AppTextTheme extends ThemeExtension<AppTextTheme> {
  const AppTextTheme({
    this.largeTitleBold,
    this.largeTitleMedium,
    this.largeTitleRegular,
    this.title1Bold,
    this.title1Medium,
    this.title1Regular,
    this.title2SemiBold,
    this.title2Medium,
    this.title2Regular,
    this.title3Semibold,
    this.title3Medium,
    this.title3Regular,
    this.headlineSemibold,
    this.headlineMedium,
    this.headlineRegular,
    this.bodySemibold,
    this.bodyMedium,
    this.bodyRegular,
    this.subheadlineSemibold,
    this.subheadlineMedium,
    this.subheadlineRegular,
    this.calloutSemibold,
    this.calloutMedium,
    this.calloutRegular,
    this.footnoteSemibold,
    this.footnoteMedium,
    this.footnoteRegular,
    this.captionCaption1Semibold,
    this.captionCaption1Medium,
    this.captionCaption1Regular,
    this.captionCaption2Regular,
    this.captionCaption2Medium,
    this.captionCaption2Semibold,
    this.buttonTextLarge,
  });
  const AppTextTheme.design()
      : this(
          largeTitleBold: AppTextStyle.largeTitleBold,
          largeTitleMedium: AppTextStyle.largeTitleMedium,
          largeTitleRegular: AppTextStyle.largeTitleRegular,
          title1Bold: AppTextStyle.title1Bold,
          title1Medium: AppTextStyle.title1Medium,
          title1Regular: AppTextStyle.title1Regular,
          title2SemiBold: AppTextStyle.title2SemiBold,
          title2Medium: AppTextStyle.title2Medium,
          title2Regular: AppTextStyle.title2Regular,
          title3Semibold: AppTextStyle.title3Semibold,
          title3Medium: AppTextStyle.title3Medium,
          title3Regular: AppTextStyle.title3Regular,
          headlineSemibold: AppTextStyle.headlineSemibold,
          headlineMedium: AppTextStyle.headlineMedium,
          headlineRegular: AppTextStyle.headlineRegular,
          bodySemibold: AppTextStyle.bodySemibold,
          bodyMedium: AppTextStyle.bodyMedium,
          bodyRegular: AppTextStyle.bodyRegular,
          subheadlineSemibold: AppTextStyle.subheadlineSemibold,
          subheadlineMedium: AppTextStyle.subheadlineMedium,
          subheadlineRegular: AppTextStyle.subheadlineRegular,
          calloutSemibold: AppTextStyle.calloutSemibold,
          calloutMedium: AppTextStyle.calloutMedium,
          calloutRegular: AppTextStyle.calloutRegular,
          footnoteSemibold: AppTextStyle.footnoteSemibold,
          footnoteMedium: AppTextStyle.footnoteMedium,
          footnoteRegular: AppTextStyle.footnoteRegular,
          captionCaption1Semibold: AppTextStyle.captionCaption1Semibold,
          captionCaption1Medium: AppTextStyle.captionCaption1Medium,
          captionCaption1Regular: AppTextStyle.captionCaption1Regular,
          captionCaption2Regular: AppTextStyle.captionCaption2Regular,
          captionCaption2Medium: AppTextStyle.captionCaption2Medium,
          captionCaption2Semibold: AppTextStyle.captionCaption2Semibold,
          buttonTextLarge: AppTextStyle.buttonTextLarge,
        );
  const AppTextTheme.fallback()
      : this(
          largeTitleBold: AppTextStyle.largeTitleBold,
          largeTitleMedium: AppTextStyle.largeTitleMedium,
          largeTitleRegular: AppTextStyle.largeTitleRegular,
          title1Bold: AppTextStyle.title1Bold,
          title1Medium: AppTextStyle.title1Medium,
          title1Regular: AppTextStyle.title1Regular,
          title2SemiBold: AppTextStyle.title2SemiBold,
          title2Medium: AppTextStyle.title2Medium,
          title2Regular: AppTextStyle.title2Regular,
          title3Semibold: AppTextStyle.title3Semibold,
          title3Medium: AppTextStyle.title3Medium,
          title3Regular: AppTextStyle.title3Regular,
          headlineSemibold: AppTextStyle.headlineSemibold,
          headlineMedium: AppTextStyle.headlineMedium,
          headlineRegular: AppTextStyle.headlineRegular,
          bodySemibold: AppTextStyle.bodySemibold,
          bodyMedium: AppTextStyle.bodyMedium,
          bodyRegular: AppTextStyle.bodyRegular,
          subheadlineSemibold: AppTextStyle.subheadlineSemibold,
          subheadlineMedium: AppTextStyle.subheadlineMedium,
          subheadlineRegular: AppTextStyle.subheadlineRegular,
          calloutSemibold: AppTextStyle.calloutSemibold,
          calloutMedium: AppTextStyle.calloutMedium,
          calloutRegular: AppTextStyle.calloutRegular,
          footnoteSemibold: AppTextStyle.footnoteSemibold,
          footnoteMedium: AppTextStyle.footnoteMedium,
          footnoteRegular: AppTextStyle.footnoteRegular,
          captionCaption1Semibold: AppTextStyle.captionCaption1Semibold,
          captionCaption1Medium: AppTextStyle.captionCaption1Medium,
          captionCaption1Regular: AppTextStyle.captionCaption1Regular,
          captionCaption2Regular: AppTextStyle.captionCaption2Regular,
          captionCaption2Medium: AppTextStyle.captionCaption2Medium,
          captionCaption2Semibold: AppTextStyle.captionCaption2Semibold,
          buttonTextLarge: AppTextStyle.buttonTextLarge,
        );
  final TextStyle? largeTitleBold;
  final TextStyle? largeTitleMedium;
  final TextStyle? largeTitleRegular;
  final TextStyle? title1Bold;
  final TextStyle? title1Medium;
  final TextStyle? title1Regular;
  final TextStyle? title2SemiBold;
  final TextStyle? title2Medium;
  final TextStyle? title2Regular;
  final TextStyle? title3Semibold;
  final TextStyle? title3Medium;
  final TextStyle? title3Regular;
  final TextStyle? headlineSemibold;
  final TextStyle? headlineMedium;
  final TextStyle? headlineRegular;
  final TextStyle? bodySemibold;
  final TextStyle? bodyMedium;
  final TextStyle? bodyRegular;
  final TextStyle? subheadlineSemibold;
  final TextStyle? subheadlineMedium;
  final TextStyle? subheadlineRegular;
  final TextStyle? calloutSemibold;
  final TextStyle? calloutMedium;
  final TextStyle? calloutRegular;
  final TextStyle? footnoteSemibold;
  final TextStyle? footnoteMedium;
  final TextStyle? footnoteRegular;
  final TextStyle? captionCaption1Semibold;
  final TextStyle? captionCaption1Medium;
  final TextStyle? captionCaption1Regular;
  final TextStyle? captionCaption2Regular;
  final TextStyle? captionCaption2Medium;
  final TextStyle? captionCaption2Semibold;
  final TextStyle? buttonTextLarge;

  @override
  AppTextTheme copyWith({
    TextStyle? largeTitleBold,
    TextStyle? largeTitleMedium,
    TextStyle? largeTitleRegular,
    TextStyle? title1Bold,
    TextStyle? title1Medium,
    TextStyle? title1Regular,
    TextStyle? title2SemiBold,
    TextStyle? title2Medium,
    TextStyle? title2Regular,
    TextStyle? title3Semibold,
    TextStyle? title3Medium,
    TextStyle? title3Regular,
    TextStyle? headlineSemibold,
    TextStyle? headlineMedium,
    TextStyle? headlineRegular,
    TextStyle? bodySemibold,
    TextStyle? bodyMedium,
    TextStyle? bodyRegular,
    TextStyle? subheadlineSemibold,
    TextStyle? subheadlineMedium,
    TextStyle? subheadlineRegular,
    TextStyle? calloutSemibold,
    TextStyle? calloutMedium,
    TextStyle? calloutRegular,
    TextStyle? footnoteSemibold,
    TextStyle? footnoteMedium,
    TextStyle? footnoteRegular,
    TextStyle? captionCaption1Semibold,
    TextStyle? captionCaption1Medium,
    TextStyle? captionCaption1Regular,
    TextStyle? captionCaption2Regular,
    TextStyle? captionCaption2Medium,
    TextStyle? captionCaption2Semibold,
    TextStyle? buttonTextLarge,
  }) {
    return AppTextTheme(
      largeTitleBold: largeTitleBold ?? this.largeTitleBold,
      largeTitleMedium: largeTitleMedium ?? this.largeTitleMedium,
      largeTitleRegular: largeTitleRegular ?? this.largeTitleRegular,
      title1Bold: title1Bold ?? this.title1Bold,
      title1Medium: title1Medium ?? this.title1Medium,
      title1Regular: title1Regular ?? this.title1Regular,
      title2SemiBold: title2SemiBold ?? this.title2SemiBold,
      title2Medium: title2Medium ?? this.title2Medium,
      title2Regular: title2Regular ?? this.title2Regular,
      title3Semibold: title3Semibold ?? this.title3Semibold,
      title3Medium: title3Medium ?? this.title3Medium,
      title3Regular: title3Regular ?? this.title3Regular,
      headlineSemibold: headlineSemibold ?? this.headlineSemibold,
      headlineMedium: headlineMedium ?? this.headlineMedium,
      headlineRegular: headlineRegular ?? this.headlineRegular,
      bodySemibold: bodySemibold ?? this.bodySemibold,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodyRegular: bodyRegular ?? this.bodyRegular,
      subheadlineSemibold: subheadlineSemibold ?? this.subheadlineSemibold,
      subheadlineMedium: subheadlineMedium ?? this.subheadlineMedium,
      subheadlineRegular: subheadlineRegular ?? this.subheadlineRegular,
      calloutSemibold: calloutSemibold ?? this.calloutSemibold,
      calloutMedium: calloutMedium ?? this.calloutMedium,
      calloutRegular: calloutRegular ?? this.calloutRegular,
      footnoteSemibold: footnoteSemibold ?? this.footnoteSemibold,
      footnoteMedium: footnoteMedium ?? this.footnoteMedium,
      footnoteRegular: footnoteRegular ?? this.footnoteRegular,
      captionCaption1Semibold:
          captionCaption1Semibold ?? this.captionCaption1Semibold,
      captionCaption1Medium:
          captionCaption1Medium ?? this.captionCaption1Medium,
      captionCaption1Regular:
          captionCaption1Regular ?? this.captionCaption1Regular,
      captionCaption2Regular:
          captionCaption2Regular ?? this.captionCaption2Regular,
      captionCaption2Medium:
          captionCaption2Medium ?? this.captionCaption2Medium,
      captionCaption2Semibold:
          captionCaption2Semibold ?? this.captionCaption2Semibold,
      buttonTextLarge: buttonTextLarge ?? this.buttonTextLarge,
    );
  }

  @override
  AppTextTheme lerp(AppTextTheme? other, double t) {
    if (other is! AppTextTheme) return this;
    return AppTextTheme(
      largeTitleBold: TextStyle.lerp(largeTitleBold, other.largeTitleBold, t),
      largeTitleMedium:
          TextStyle.lerp(largeTitleMedium, other.largeTitleMedium, t),
      largeTitleRegular:
          TextStyle.lerp(largeTitleRegular, other.largeTitleRegular, t),
      title1Bold: TextStyle.lerp(title1Bold, other.title1Bold, t),
      title1Medium: TextStyle.lerp(title1Medium, other.title1Medium, t),
      title1Regular: TextStyle.lerp(title1Regular, other.title1Regular, t),
      title2SemiBold: TextStyle.lerp(title2SemiBold, other.title2SemiBold, t),
      title2Medium: TextStyle.lerp(title2Medium, other.title2Medium, t),
      title2Regular: TextStyle.lerp(title2Regular, other.title2Regular, t),
      title3Semibold: TextStyle.lerp(title3Semibold, other.title3Semibold, t),
      title3Medium: TextStyle.lerp(title3Medium, other.title3Medium, t),
      title3Regular: TextStyle.lerp(title3Regular, other.title3Regular, t),
      headlineSemibold:
          TextStyle.lerp(headlineSemibold, other.headlineSemibold, t),
      headlineMedium: TextStyle.lerp(headlineMedium, other.headlineMedium, t),
      headlineRegular:
          TextStyle.lerp(headlineRegular, other.headlineRegular, t),
      bodySemibold: TextStyle.lerp(bodySemibold, other.bodySemibold, t),
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t),
      bodyRegular: TextStyle.lerp(bodyRegular, other.bodyRegular, t),
      subheadlineSemibold:
          TextStyle.lerp(subheadlineSemibold, other.subheadlineSemibold, t),
      subheadlineMedium:
          TextStyle.lerp(subheadlineMedium, other.subheadlineMedium, t),
      subheadlineRegular:
          TextStyle.lerp(subheadlineRegular, other.subheadlineRegular, t),
      calloutSemibold:
          TextStyle.lerp(calloutSemibold, other.calloutSemibold, t),
      calloutMedium: TextStyle.lerp(calloutMedium, other.calloutMedium, t),
      calloutRegular: TextStyle.lerp(calloutRegular, other.calloutRegular, t),
      footnoteSemibold:
          TextStyle.lerp(footnoteSemibold, other.footnoteSemibold, t),
      footnoteMedium: TextStyle.lerp(footnoteMedium, other.footnoteMedium, t),
      footnoteRegular:
          TextStyle.lerp(footnoteRegular, other.footnoteRegular, t),
      captionCaption1Semibold: TextStyle.lerp(
        captionCaption1Semibold,
        other.captionCaption1Semibold,
        t,
      ),
      captionCaption1Medium:
          TextStyle.lerp(captionCaption1Medium, other.captionCaption1Medium, t),
      captionCaption1Regular: TextStyle.lerp(
        captionCaption1Regular,
        other.captionCaption1Regular,
        t,
      ),
      captionCaption2Regular: TextStyle.lerp(
        captionCaption2Regular,
        other.captionCaption2Regular,
        t,
      ),
      captionCaption2Medium:
          TextStyle.lerp(captionCaption2Medium, other.captionCaption2Medium, t),
      captionCaption2Semibold: TextStyle.lerp(
        captionCaption2Semibold,
        other.captionCaption2Semibold,
        t,
      ),
      buttonTextLarge:
          TextStyle.lerp(buttonTextLarge, other.buttonTextLarge, t),
    );
  }
}

abstract class AppTextStyle {
  // largeTitleBold Text Style
  static const TextStyle largeTitleBold = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w700, // bold
    height: 1.12, // 38px
    letterSpacing: 0.37,
    fontFamily: 'SF Pro Display',
  );
  // largeTitleMedium Text Style
  static const TextStyle largeTitleMedium = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w500, // medium
    height: 1.12, // 38px
    letterSpacing: 0.37,
    fontFamily: 'SF Pro Display',
  );
  // largeTitleRegular Text Style
  static const TextStyle largeTitleRegular = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w400, // regular
    height: 1.12, // 38px
    letterSpacing: 0.37,
    fontFamily: 'SF Pro Display',
  );
  // title1Bold Text Style
  static const TextStyle title1Bold = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700, // bold
    height: 1.21, // 34px
    letterSpacing: 0.36,
    fontFamily: 'SF Pro Display',
  );
  // title1Medium Text Style
  static const TextStyle title1Medium = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w500, // medium
    height: 1.21, // 34px
    letterSpacing: 0.36,
    fontFamily: 'SF Pro Display',
  );
  // title1Regular Text Style
  static const TextStyle title1Regular = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w400, // regular
    height: 1.21, // 34px
    letterSpacing: 0.36,
    fontFamily: 'SF Pro Display',
  );
  // title2SemiBold Text Style
  static const TextStyle title2SemiBold = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600, // semi bold
    height: 1.27, // 28px
    letterSpacing: 0.35,
    fontFamily: 'SF Pro Display',
  );
  // title2Medium Text Style
  static const TextStyle title2Medium = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500, // medium
    height: 1.27, // 28px
    letterSpacing: 0.35,
    fontFamily: 'SF Pro Display',
  );
  // title2Regular Text Style
  static const TextStyle title2Regular = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400, // regular
    height: 1.27, // 28px
    letterSpacing: 0.35,
    fontFamily: 'SF Pro Display',
  );
  // title3Semibold Text Style
  static const TextStyle title3Semibold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600, // semi bold
    height: 1.2, // 24px
    letterSpacing: 0.38,
    fontFamily: 'SF Pro Display',
  );
  // title3Medium Text Style
  static const TextStyle title3Medium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500, // medium
    height: 1.2, // 24px
    letterSpacing: 0.38,
    fontFamily: 'SF Pro Display',
  );
  // title3Regular Text Style
  static const TextStyle title3Regular = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400, // regular
    height: 1.2, // 24px
    letterSpacing: 0.38,
    fontFamily: 'SF Pro Display',
  );
  // headlineSemibold Text Style
  static const TextStyle headlineSemibold = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600, // semi bold
    height: 1.29, // 22px
    letterSpacing: -0.41,
    fontFamily: 'SF Pro Text',
  );
  // headlineMedium Text Style
  static const TextStyle headlineMedium = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500, // medium
    height: 1.29, // 22px
    letterSpacing: -0.41,
    fontFamily: 'SF Pro Text',
  );
  // headlineRegular Text Style
  static const TextStyle headlineRegular = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w400, // regular
    height: 1.29, // 22px
    letterSpacing: -0.41,
    fontFamily: 'SF Pro Text',
  );
  // bodySemibold Text Style
  static const TextStyle bodySemibold = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600, // semi bold
    height: 1.41, // 24px
    letterSpacing: -0.41,
    fontFamily: 'SF Pro Text',
  );
  // bodyMedium Text Style
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500, // medium
    height: 1.41, // 24px
    letterSpacing: -0.41,
    fontFamily: 'SF Pro Text',
  );
  // bodyRegular Text Style
  static const TextStyle bodyRegular = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w400, // regular
    height: 1.41, // 24px
    letterSpacing: -0.41,
    fontFamily: 'SF Pro Text',
  );
  // subheadlineSemibold Text Style
  static const TextStyle subheadlineSemibold = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600, // semi bold
    height: 1.33, // 20px
    letterSpacing: -0.24,
    fontFamily: 'SF Pro Text',
  );
  // subheadlineMedium Text Style
  static const TextStyle subheadlineMedium = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500, // medium
    height: 1.33, // 20px
    letterSpacing: -0.24,
    fontFamily: 'SF Pro Text',
  );
  // subheadlineRegular Text Style
  static const TextStyle subheadlineRegular = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400, // regular
    height: 1.33, // 20px
    letterSpacing: -0.24,
    fontFamily: 'SF Pro Text',
  );
  // calloutSemibold Text Style
  static const TextStyle calloutSemibold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600, // semi bold
    height: 1.38, // 22px
    letterSpacing: -0.32,
    fontFamily: 'SF Pro Text',
  );
  // calloutMedium Text Style
  static const TextStyle calloutMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500, // medium
    height: 1.38, // 22px
    letterSpacing: -0.32,
    fontFamily: 'SF Pro Text',
  );
  // calloutRegular Text Style
  static const TextStyle calloutRegular = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400, // regular
    height: 1.38, // 22px
    letterSpacing: -0.32,
    fontFamily: 'SF Pro Text',
  );
  // footnoteSemibold Text Style
  static const TextStyle footnoteSemibold = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600, // semi bold
    height: 1.38, // 18px
    letterSpacing: -0.08,
    fontFamily: 'SF Pro Text',
  );
  // footnoteMedium Text Style
  static const TextStyle footnoteMedium = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500, // medium
    height: 1.38, // 18px
    letterSpacing: -0.08,
    fontFamily: 'SF Pro Text',
  );
  // footnoteRegular Text Style
  static const TextStyle footnoteRegular = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400, // regular
    height: 1.38, // 18px
    letterSpacing: -0.08,
    fontFamily: 'SF Pro Text',
  );
  // captionCaption1Semibold Text Style
  static const TextStyle captionCaption1Semibold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600, // semi bold
    height: 1.33, // 16px
    fontFamily: 'SF Pro Text',
  );
  // captionCaption1Medium Text Style
  static const TextStyle captionCaption1Medium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500, // medium
    height: 1.33, // 16px
    fontFamily: 'SF Pro Text',
  );
  // captionCaption1Regular Text Style
  static const TextStyle captionCaption1Regular = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400, // regular
    height: 1.33, // 16px
    fontFamily: 'SF Pro Text',
  );
  // captionCaption2Regular Text Style
  static const TextStyle captionCaption2Regular = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400, // regular
    height: 1.45, // 16px
    letterSpacing: 0.07,
    fontFamily: 'SF Pro Text',
  );
  // captionCaption2Medium Text Style
  static const TextStyle captionCaption2Medium = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500, // medium
    height: 1.45, // 16px
    letterSpacing: 0.07,
    fontFamily: 'SF Pro Text',
  );
  // captionCaption2Semibold Text Style
  static const TextStyle captionCaption2Semibold = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600, // semi bold
    height: 1.45, // 16px
    letterSpacing: 0.07,
    fontFamily: 'SF Pro Text',
  );
  // buttonTextLarge Text Style
  static const TextStyle buttonTextLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600, // semi bold
    height: 1.14, // 16px
    fontFamily: 'SF Pro Text',
  );
}
