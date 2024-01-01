import 'package:flutter/material.dart';

import '../../../core/util/extension/context_ext.dart';
import '../../style/app_colors.dart';

class Txt extends StatelessWidget {
  Txt.regularPrimary(this.context, this.content, {this.textAlign, super.key})
      : style = context.textTheme.footnoteRegular
            ?.copyWith(color: AppColors.labelLightPrimary);
  Txt.regularSec(this.context, this.content, {this.textAlign, super.key})
      : style = context.textTheme.footnoteRegular
            ?.copyWith(color: AppColors.labelLightSecondary);
  Txt.priceSec(this.context, this.content, {this.textAlign, super.key})
      : style = context.textTheme.footnoteRegular
            ?.copyWith(color: AppColors.labelLightSecondary.withOpacity(0.2));
  Txt.priceBig(this.context, this.content, {this.textAlign, super.key})
      : style = context.textTheme.headlineSemibold
            ?.copyWith(color: AppColors.labelLightPrimary);
  Txt.priceSM(this.context, this.content, {this.textAlign, super.key})
      : style = context.textTheme.footnoteMedium
            ?.copyWith(color: AppColors.labelLightPrimary);
  Txt.lineThrough(this.context, this.content, {this.textAlign, super.key})
      : style = context.textTheme.footnoteRegular?.copyWith(
          color: AppColors.labelLightSecondary,
          decoration: TextDecoration.lineThrough,
          decorationColor: context.color.labelLightSecondary,
          decorationThickness: 0.5,
        );
  Txt.rating(this.context, this.content, {this.textAlign, super.key})
      : style = context.textTheme.footnoteMedium
            ?.copyWith(color: AppColors.labelLightPrimary);
  Txt.distance(this.context, this.content, {this.textAlign, super.key})
      : style = context.textTheme.footnoteMedium?.copyWith(color: Colors.white);
  Txt.open(this.context, {this.textAlign, super.key})
      : content = 'Open',
        style = context.textTheme.footnoteRegular
            ?.copyWith(color: AppColors.systemColorGreenLight);
  Txt.closed(this.context, {this.textAlign, super.key})
      : content = 'Closed',
        style = context.textTheme.footnoteRegular
            ?.copyWith(color: AppColors.systemColorRedLightPrimary);
  Txt.openingSoon(this.context, {this.textAlign, super.key})
      : content = 'Opening Soon',
        style = context.textTheme.footnoteRegular
            ?.copyWith(color: AppColors.systemColorOrangeLight);

  Txt.pinBig(this.context, this.content, {super.key})
      : style = context.textTheme.subheadlineSemibold
            ?.copyWith(color: Colors.white),
        textAlign = TextAlign.center;
  Txt.pinSM(this.context, this.content, {super.key})
      : style = context.textTheme.captionCaption2Medium
            ?.copyWith(color: Colors.white),
        textAlign = TextAlign.center;

  Txt.bullet(this.context, {super.key})
      : content = ' • ',
        style = context.textTheme.footnoteRegular
            ?.copyWith(color: context.color.labelLightSecondary),
        textAlign = TextAlign.center;

  final BuildContext context;
  final String content;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: style,
      textAlign: textAlign ?? TextAlign.start,
      overflow: TextOverflow.ellipsis,
    );
  }
}
