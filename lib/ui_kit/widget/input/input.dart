import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/util/extension/context_ext.dart';
import '../../../core/util/regex.dart';
import '../../../feature/auth/presentation/view/auth_layout.dart';
import '../../../router/show.dart';
import '../../style/app_colors.dart';
import '../../style/app_radius.dart';
import '../../style/gap.dart';
import '../../style/ny_icons.dart';
import '../../template/country_picker_modal.dart';
import '../../theme/app_text_theme.dart';
import '../button/button.dart';
import '../indicator/animate_switch.dart';

part '_input/_input_board_search.dart';
part '_input/_input_comment.dart';
part '_input/_input_email.dart';
part '_input/_input_name.dart';
part '_input/_input_password.dart';
part '_input/_input_phone.dart';
part '_input/_input_verification.dart';
part '_input/_input_voucher.dart';

class Input extends StatelessWidget {
  const Input._({required this.input});

  /// Primary Filled Elevated Button with string title and primary color
  factory Input.email({
    required TextEditingController controller,
  }) {
    return Input._(
      input: _InputEmail(
        controller: controller,
      ),
    );
  }

  factory Input.password({
    required TextEditingController controller,
  }) {
    return Input._(
      input: _InputPassword(
        controller: controller,
      ),
    );
  }

  factory Input.phone({
    required TextEditingController controller,
  }) {
    return Input._(
      input: _InputPhone(
        controller: controller,
      ),
    );
  }

  factory Input.verification() {
    return const Input._(
      input: _InputVerification(),
    );
  }

  factory Input.name({
    required TextEditingController controller,
    bool isFirstName = true,
  }) {
    return Input._(
      input: _InputName(
        controller: controller,
        isFirstName: isFirstName,
      ),
    );
  }

  factory Input.comment({
    required TextEditingController controller,
    required String hintText,
    required int maxLength,
  }) =>
      Input._(
        input: _InputComment(
          controller: controller,
          hintText: hintText,
          maxLength: maxLength,
        ),
      );

  factory Input.voucher({
    required TextEditingController controller,
    required String hint,
  }) =>
      Input._(
        input: _InputVoucher(
          controller: controller,
          hint: hint,
        ),
      );

  factory Input.boardSearch({
    required TextEditingController controller,
  }) =>
      Input._(
        input: _BoardSearchBar(
          controller: controller,
        ),
      );

  final Widget input;

  @override
  Widget build(BuildContext context) {
    return input;
  }
}

class _Input extends TextFormField {
  _Input({
    super.controller,
    InputDecoration decoration = const InputDecoration(),
    super.style,
    super.textAlign,
    super.onChanged,
    super.onSaved,
    super.obscureText,
    super.minLines,
    super.maxLines = null,
    super.maxLength,
    super.autofocus,
    super.textAlignVertical,
    List<String>? super.autofillHints,
    super.keyboardType,
    super.textInputAction,
    super.inputFormatters,
  }) : super(
          cursorHeight: 20.h,
          decoration: decoration.copyWith(
            contentPadding:
                EdgeInsets.symmetric(vertical: 18.h, horizontal: 16),
            alignLabelWithHint: true,
            label: decoration.label != null
                ? Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: decoration.label,
                  )
                : decoration.label,
          ),
          onTapOutside: (event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
        );
}

class _ClearIconButton extends StatelessWidget {
  const _ClearIconButton({
    required TextEditingController controller,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _controller.clear,
      icon: Icon(
        NyIcons.cross_filled,
        color: context.color.systemColorGrayLight,
      ),
    );
  }
}

void Function(PointerDownEvent)? onTapOutside(BuildContext context) {
  return (event) => FocusScope.of(context).requestFocus(FocusNode());
}

class TextInputValidationError extends StatelessWidget {
  const TextInputValidationError({
    required this.message,
    super.key,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.w),
      child: Row(
        children: [
          Icon(
            NyIcons.warn_circle_filled,
            color: context.color.systemColorRedLightPrimary,
            size: 20,
          ),
          Gap.horXS,
          Text(
            message,
            style: context.textTheme.footnoteRegular?.copyWith(
              color: context.color.systemColorRedLightPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
