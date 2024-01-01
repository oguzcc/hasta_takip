part of '../input.dart';

class _InputVoucher extends StatelessWidget {
  const _InputVoucher({
    required TextEditingController controller,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Input(
          controller: _controller,
          decoration: const InputDecoration(
            hintText: 'Voucher',
          ),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
        ),
      ],
    );
  }
}
