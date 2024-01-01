part of '../input.dart';

class _InputPassword extends StatefulWidget {
  const _InputPassword({
    required TextEditingController controller,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  State<_InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<_InputPassword> {
  bool obscureText = true;
  void changeObscure() => setState(() => obscureText = !obscureText);

  @override
  Widget build(BuildContext context) {
    final error = widget._controller.text.length > 40;

    return Column(
      children: [
        _Input(
          controller: widget._controller,
          decoration: InputDecoration(
            hintText: 'Password',
            suffixIcon: AnimateSwitch(
              child: Button.passwordEye(
                obscureText: obscureText,
                changeObscure: changeObscure,
              ),
            ),
          ),
          obscureText: obscureText,
          inputFormatters: [
            LengthLimitingTextInputFormatter(40),
          ],
          maxLines: 1,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
        ),
        if (error)
          const TextInputValidationError(
            message: 'Error',
          ),
      ],
    );
  }
}
