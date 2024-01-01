part of 'theme.dart';

ChipThemeData get _chipTheme => ChipThemeData(
      backgroundColor: _backgroundColor(),
      labelStyle: _labelStyle(),
      elevation: 0,
      padding: AppPadding.chip,
      side: BorderSide.none,
      iconTheme: _iconTheme(),
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.chip(),
      ),
    );

IconThemeData _iconTheme() {
  return IconThemeData(
    color: MaterialStateColor.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return const Color(0xff038189);
      }
      if (states.contains(MaterialState.disabled)) {
        return const Color(0x1F9E9E9E);
      }
      return const Color(0x801A282F);
    }),
  );
}

MaterialStateTextStyle _labelStyle() {
  return MaterialStateTextStyle.resolveWith(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const TextStyle(
          color: Color(0xff038189),
        );
      }
      if (states.contains(MaterialState.disabled)) {
        return const TextStyle(
          color: Color(0x1F9E9E9E),
        );
      }
      return const TextStyle(
        color: Color(0x801A282F),
      );
    },
  );
}

MaterialStateColor _backgroundColor() {
  return MaterialStateColor.resolveWith((states) {
    if (states.contains(MaterialState.selected)) {
      return const Color(0x1F038189);
    }
    if (states.contains(MaterialState.disabled)) {
      return const Color(0x1F9E9E9E);
    }
    return const Color(0x1F9E9E9E);
  });
}
