import 'package:flutter/material.dart';

import '../../core/util/extension/context_ext.dart';
import '../style/app_colors.dart';
import '../style/gap.dart';
import '../widget/avatar/avatar.dart';

class RestaurantHeaderTile extends StatelessWidget {
  const RestaurantHeaderTile({
    required this.title,
    required this.subtitle,
    super.key,
    this.leading,
    this.thirdLine,
    this.trailing,
    this.isThirdLineWidget,
    this.thirdLineWidget,
  });
  final NetworkImage? leading;
  final String title;
  final String subtitle;
  final List<String>? thirdLine;
  final String? trailing;
  final bool? isThirdLineWidget;
  final Widget? thirdLineWidget;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: thirdLine == null
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Avatar.logo(
          image: leading,
        ),
        Gap.horSM,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                overflow: trailing != null ? TextOverflow.ellipsis : null,
                style: context.textTheme.headlineSemibold?.copyWith(
                  color: context.color.labelLightPrimary,
                ),
              ),
              Text(
                subtitle,
                style: context.textTheme.subheadlineRegular?.copyWith(
                  color: context.color.labelLightSecondary,
                ),
              ),
              if (isThirdLineWidget ?? false) thirdLineWidget!,
              if (thirdLine != null &&
                  thirdLine!.length == 2 &&
                  !(isThirdLineWidget ?? false))
                Row(
                  children: [
                    Text(
                      thirdLine![0],
                      style: context.textTheme.footnoteRegular?.copyWith(
                        color: context.color.systemColorGreenLight,
                      ),
                    ),
                    Text(
                      thirdLine![1],
                      style: context.textTheme.footnoteRegular?.copyWith(
                        color: context.color.labelLightSecondary,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
        if (trailing != null)
          InkWell(
            // TODO(change): change this code like below
            // onTap: () => context.pushNamed(Screens.restaurantReview.name),
            onTap: () {},
            child: Chip(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              label: Row(
                children: [
                  const Icon(Icons.star, size: 16),
                  const SizedBox(width: 6),
                  Text(trailing!),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
