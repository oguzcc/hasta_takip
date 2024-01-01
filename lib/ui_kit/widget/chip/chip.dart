import 'package:flutter/material.dart';

import '../../../core/util/extension/context_ext.dart';
import '../../style/app_colors.dart';
import '../../style/gap.dart';

class Chips extends StatelessWidget {
  const Chips._({required this.chip});
  //Chips label small
  factory Chips.small({
    required String label,
  }) {
    return Chips._(
      chip: _ChipLabel(
        label: label,
      ),
    );
  }

  //Chips icon and label
  factory Chips.icon({
    required IconData icon,
    required String label,
  }) {
    return Chips._(
      chip: _ChipIcon(
        icon: icon,
        label: label,
      ),
    );
  }

  //Chips icon and label
  factory Chips.iconStatic({
    required IconData icon,
    required String label,
  }) {
    return Chips._(
      chip: _ChipIconStatic(
        icon: icon,
        label: label,
      ),
    );
  }

  final Widget chip;

  @override
  Widget build(BuildContext context) {
    return chip;
  }
}

class _ChipLabel extends StatelessWidget {
  const _ChipLabel({
    required this.label,
  });
  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      visualDensity: VisualDensity.compact,
    );
  }
}

class _ChipIcon extends StatefulWidget {
  const _ChipIcon({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  State<_ChipIcon> createState() => __ChipIconState();
}

class __ChipIconState extends State<_ChipIcon> {
  bool selected = false;
  void changeSelected() => setState(() => selected = !selected);

  // TODO: Get colors and states from theme
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 9,
      ),
      labelStyle: TextStyle(
        color: selected
            ? context.color.buttonsTextColorOpacityPrimary
            : context.color.labelLightSecondary,
      ),
      backgroundColor: selected
          ? context.color.buttonsBgColorOpacityDefault
          : context.color.fillColorLightTeartly,
      label: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            widget.icon,
            color: selected
                ? context.color.buttonsTextColorOpacityPrimary
                : context.color.labelLightSecondary,
            size: 16,
          ),
          Gap.horXS,
          Text(
            widget.label,
            style: context.textTheme.footnoteRegular?.copyWith(
              color: selected
                  ? context.color.buttonsTextColorOpacityPrimary
                  : context.color.labelLightSecondary,
            ),
          ),
        ],
      ),
      selected: selected,
      onSelected: (selected) => changeSelected(),
      showCheckmark: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(100),
        ),
      ),
    );
  }
}

class _ChipIconStatic extends StatelessWidget {
  const _ChipIconStatic({
    required this.label,
    required this.icon,
  });

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 9,
      ),
      labelStyle: TextStyle(
        color: context.color.buttonsTextColorOpacityPrimary,
      ),
      backgroundColor: context.color.buttonsBgColorOpacityDefault,
      label: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: context.color.buttonsTextColorOpacityPrimary,
            size: 16,
          ),
          Gap.horXS,
          Text(
            label,
            style: context.textTheme.footnoteRegular?.copyWith(
              color: context.color.buttonsTextColorOpacityPrimary,
            ),
          ),
        ],
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(100),
        ),
      ),
    );
  }
}
