part of '../input.dart';

class _InputVoucher extends StatelessWidget {
  const _InputVoucher(
      {required TextEditingController controller, required this.hint})
      : _controller = controller;

  final TextEditingController _controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Input(
          controller: _controller,
          decoration: InputDecoration(
            hintText: hint,
          ),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
        ),
      ],
    );
  }
}
