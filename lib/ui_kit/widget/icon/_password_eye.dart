part of '../button/button.dart';

class _PasswordEye extends StatelessWidget {
  const _PasswordEye({
    required this.obscureText,
    required this.changeObscure,
  });

  final bool obscureText;
  final VoidCallback changeObscure;

  @override
  Widget build(BuildContext context) {
    final color = context.color.labelLightTeartly;
    return IconButton(
      key: ValueKey(obscureText),
      onPressed: changeObscure,
      icon: obscureText
          ? Icon(NyIcons.eye_off, color: color)
          : Icon(NyIcons.eye, color: color),
    );
  }
}
