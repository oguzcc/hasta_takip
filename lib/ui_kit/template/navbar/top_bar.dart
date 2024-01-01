import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/util/extension/context_ext.dart';
import '../../widget/button/button.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  //AppBar with back button and centered title
  TopBar.back({
    this.title,
    this.onLeadingTap,
    this.actions,
    this.forceMaterialTransparency = true,
    this.isDark,
    super.key,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        leadingBtn = Button.navBack(onTap: onLeadingTap, isDark: isDark),
        bottom = null;

  ///AppBar with close button and centered title
  TopBar.close({
    this.title,
    this.onLeadingTap,
    this.actions,
    this.forceMaterialTransparency = true,
    this.isDark,
    super.key,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        leadingBtn = Button.navCross(onTap: onLeadingTap, isDark: isDark),
        bottom = null;

  TopBar.tabBar({
    required this.bottom,
    this.title,
    this.onLeadingTap,
    this.actions,
    this.forceMaterialTransparency = true,
    this.isDark,
    super.key,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight * 2),
        leadingBtn = Button.navBack(onTap: onLeadingTap, isDark: isDark);

  @override
  final Size preferredSize;

  final String? title;
  final Widget? leadingBtn;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final VoidCallback? onLeadingTap;
  final bool forceMaterialTransparency;
  final bool? isDark;

  @override
  Widget build(BuildContext context) => AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: forceMaterialTransparency,
        leadingWidth: 48.w,
        title: Text(
          title ?? '',
          style: context.textTheme.headlineSemibold,
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: leadingBtn,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Row(
              children: actions
                      ?.map((e) => Row(children: [SizedBox(width: 10.w), e]))
                      .toList() ??
                  [],
            ),
          ),
        ],
        bottom: bottom,
      );
}
