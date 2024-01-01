import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasta_takip/core/util/extension/context_ext.dart';

import '../../../../router/show.dart';
import '../../../../ui_kit/style/app_colors.dart';
import '../../../../ui_kit/style/gap.dart';
import '../../../../ui_kit/template/navbar/top_bar.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({
    required this.title,
    required this.subtitle,
    required this.body,
    super.key,
    this.appBar,
    this.footer,
  });

  final PreferredSizeWidget? appBar;
  final String title;
  final String subtitle;
  final List<Widget> body;
  final List<Widget>? footer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ?? TopBar.back(title: ''),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              physics: const ClampingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Gap.verXL,
                      Text(
                        title,
                        style: context.textTheme.largeTitleBold
                            ?.copyWith(color: context.color.labelLightPrimary),
                      ),
                      Gap.verMD,
                      Text(
                        subtitle,
                        style: context.textTheme.bodyRegular?.copyWith(
                          color: context.color.labelLightSecondary,
                        ),
                      ),
                      Gap.verXXL,
                      ...body,
                      Gap.verLG,
                      const Spacer(),
                      if (footer != null) ...footer!,
                      Gap.verMD,
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Future<void> pageLoadingTransition(
  BuildContext context,
  VoidCallback onTap,
) async {
  Show.loading(context);
  Future.delayed(const Duration(milliseconds: 500), onTap);
}
