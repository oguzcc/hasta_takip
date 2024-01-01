part of 'theme.dart';

InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
      filled: true,
      fillColor: fillColor,

      // focusColor: AppColors.fillColorLightSecondary,
      border: OutlineInputBorder(
        borderRadius: AppRadius.input(),
        borderSide: BorderSide.none,
      ),
      labelStyle: const TextStyle(color: AppColors.labelLightTeartly),
      hintStyle: AppTextStyle.bodyRegular.copyWith(
        color: AppColors.labelLightTeartly,
      ),
    );

final fillColor = MaterialStateColor.resolveWith(
  (Set<MaterialState> states) {
    if (states.contains(MaterialState.focused)) {
      return AppColors.fillColorLightSecondary;
    }
    if (states.contains(MaterialState.error)) {
      return AppColors.systemColorRedLightPrimary;
    }
    return AppColors.fillColorLightTeartly;
  },
);
