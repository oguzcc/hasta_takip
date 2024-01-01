import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/util/extension/context_ext.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          4,
          (index) => SizedBox(
            width: 74.w,
            height: 74.h,
            child: TextFormField(
              autofocus: true,
              keyboardType: TextInputType.number,
              style: context.textTheme.title2Regular,
              maxLength: 1,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                counterText: '',
                contentPadding: EdgeInsets.symmetric(vertical: 24),
              ),
              onChanged: (pin1) {
                if (pin1.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              onSaved: (pin1) {},
            ),
          ),
        ),
      ),
    );
  }
}
