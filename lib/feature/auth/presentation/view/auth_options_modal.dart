import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../ui_kit/style/gap.dart';
import '../../../../ui_kit/widget/button/button.dart';
import '../../../../ui_kit/widget/indicator/drag_handle.dart';
import '../../data/model/auth_model.dart';
import '../cubit/auth_cubit.dart';

class AuthOptions extends StatelessWidget {
  const AuthOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>()..setAuthMethod(AuthMethod.login);
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const DragHandle(),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Gap.verMD,
                if (Platform.isIOS) ...[Button.google(), Gap.verMD],
                Button.facebook(),
                Gap.verMD,
                // TODO(hide): Auth with phone
                // Button.opacity(
                //   onPressed: () {
                //     PhoneController.instance().reset();
                //     cubit
                //       ..phoneNumberChanged('')
                //       ..setAuthType(AuthType.phone);
                //     context
                //       ..pop()
                //       ..pushNamed(Screens.phonePage.name);
                //   },
                //   title: LocaleAuth.continueWithPhone,
                // ),
                // Gap.verMD,
                Button.plain(
                  onPressed: () {
                    cubit
                      ..emailChanged('')
                      ..setAuthType(AuthType.email);
                  },
                  title: 'Continue with email',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
