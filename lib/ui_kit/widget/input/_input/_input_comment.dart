part of '../input.dart';

class _InputComment extends StatefulWidget {
  const _InputComment({
    required TextEditingController controller,
    required this.hintText,
    required this.maxLength,
  }) : _controller = controller;

  final TextEditingController _controller;
  final String hintText;
  final int maxLength;

  @override
  State<_InputComment> createState() => _InputCommentState();
}

class _InputCommentState extends State<_InputComment> {
  int currentLength = 0;

  @override
  void initState() {
    super.initState();
    widget._controller.addListener(
      () => setState(() => currentLength = widget._controller.text.length),
    );
  }

  @override
  void dispose() {
    widget._controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _Input(
          controller: widget._controller,
          minLines: 2,
          maxLength: widget.maxLength,
          keyboardType: TextInputType.multiline,
          style: context.textTheme.footnoteRegular,
          inputFormatters: [
            LengthLimitingTextInputFormatter(widget.maxLength),
          ],
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400, // regular
              height: 1.38, // 18px
              letterSpacing: -0.08,
              fontFamily: 'SF Pro Text',
              color: AppColors.labelLightTeartly,
            ),
            counterText: '',
            constraints: BoxConstraints(minHeight: 60.h, maxHeight: 80.h),
            filled: true,
            focusColor: AppColors.fillColorLightSecondary,
            border: OutlineInputBorder(
              borderRadius: AppRadius.input(),
              borderSide: BorderSide.none,
            ),
            labelStyle: const AppTextTheme()
                .footnoteRegular
                ?.copyWith(color: context.color.labelLightTeartly),
          ),
        ),
        Positioned(
          right: 16.w,
          bottom: 8.h,
          child: Text(
            '$currentLength/${widget.maxLength}',
            style: context.textTheme.captionCaption2Regular?.copyWith(
              color: context.color.labelLightSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
