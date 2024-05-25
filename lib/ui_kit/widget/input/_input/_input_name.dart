part of '../input.dart';

class _InputName extends StatelessWidget {
  const _InputName({
    required TextEditingController controller,
    required this.isFirstName,
  }) : _controller = controller;

  final TextEditingController _controller;
  final bool isFirstName;

  @override
  Widget build(BuildContext context) {
    final error = RegEx.hasSpecialCharacters(_controller.text);

    return Column(
      children: [
        _Input(
          controller: _controller,
          decoration: InputDecoration(
            fillColor: error ? context.colorScheme.errorContainer : null,
            label: Text(
              isFirstName ? 'İsim' : 'Last Name',
            ),
            suffixIcon: _controller.text.isNotEmpty
                ? _ClearName(controller: _controller, isFirstName: isFirstName)
                : null,
          ),
          textAlignVertical: TextAlignVertical.bottom,
          inputFormatters: [
            LengthLimitingTextInputFormatter(isFirstName ? 40 : 120),
          ],
          autofillHints: isFirstName
              ? const [AutofillHints.givenName]
              : const [AutofillHints.familyName],
          keyboardType: TextInputType.name,
          textInputAction:
              isFirstName ? TextInputAction.next : TextInputAction.done,
        ),
        if (error)
          const TextInputValidationError(
            message: 'Error',
          ),
      ],
    );
  }
}

class _ClearName extends StatelessWidget {
  const _ClearName({
    required TextEditingController controller,
    required this.isFirstName,
  }) : _controller = controller;

  final TextEditingController _controller;
  final bool isFirstName;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _controller.clear,
      icon: const Icon(
        Icons.close,
        color: Color(0x571A282F),
      ),
    );
  }
}
