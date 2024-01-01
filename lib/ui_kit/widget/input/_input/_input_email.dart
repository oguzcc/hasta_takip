part of '../input.dart';

class _InputEmail extends StatelessWidget {
  const _InputEmail({
    required TextEditingController controller,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    final error = RegEx.hasEmailSpecialCharacters(_controller.text);

    return Column(
      children: [
        _Input(
          controller: _controller,
          decoration: InputDecoration(
            fillColor: error ? context.colorScheme.errorContainer : null,
            label: const Text('Email'),
            suffixIcon: _controller.text.isNotEmpty
                ? _ClearIconButton(controller: _controller)
                : null,
          ),
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(r'\s')),
            LengthLimitingTextInputFormatter(120),
          ],
          autofillHints: const [AutofillHints.email],
          keyboardType: TextInputType.emailAddress,
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
