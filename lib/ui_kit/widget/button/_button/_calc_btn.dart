part of '../button.dart';

class _CalcBtn extends StatefulWidget {
  _CalcBtn.small({bool? isDisabled})
      : width = 100.w,
        height = 32.h,
        radius = 100.r,
        bg = AppColors.fillColorLightTeartly,
        gap = SizedBox(width: 6.w),
        _isDisabled = isDisabled ?? false;
  _CalcBtn.medium({bool? isDisabled})
      : width = 156.w,
        height = 32.h,
        radius = 100.r,
        bg = AppColors.labelDarkPrimary,
        gap = Gap.horMD,
        _isDisabled = isDisabled ?? false;
  _CalcBtn.large({bool? isDisabled})
      : width = 120.w,
        height = 50.h,
        radius = 14.r,
        bg = AppColors.fillColorLightTeartly,
        gap = Gap.horSM,
        _isDisabled = isDisabled ?? false;

  final double width;
  final double height;
  final double radius;
  final Color bg;

  final Widget gap;
  final bool _isDisabled;

  @override
  State<_CalcBtn> createState() => _CalcBtnState();
}

class _CalcBtnState extends State<_CalcBtn> {
  final calc = CalcState();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius),
        color: widget.bg,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (calc.counter != 0)
            _CalcItem(
              icon: Icon(
                NyIcons.minus,
                size: 16,
                color: widget._isDisabled
                    ? const Color(0x661A282F)
                    : const Color(0xFF1A282F),
              ),
              onPressed: () => setState(calc.decrement),
            ),
          Expanded(
            child: calc.counter == 0
                ? _CalcItem(
                    icon: Icon(
                      NyIcons.plus,
                      size: 16,
                      color: widget._isDisabled
                          ? const Color(0x661A282F)
                          : const Color(0xFF1A282F),
                    ),
                    onPressed: () => setState(calc.increment),
                  )
                : Text(
                    '${calc.counter}',
                    textAlign: TextAlign.center,
                    style: context.textTheme.buttonTextLarge?.copyWith(
                      color: widget._isDisabled
                          ? const Color(0x661A282F)
                          : const Color(0xFF1A282F),
                    ),
                  ),
          ),
          if (calc.counter != 0)
            _CalcItem(
              icon: Icon(
                NyIcons.plus,
                size: 16,
                color: widget._isDisabled || calc.counter != 99
                    ? context.color.labelLightPrimary
                    : context.color.systemColorGrayLight,
              ),
              onPressed: () => setState(calc.increment),
            ),
        ],
      ),
    );
  }
}

class _CalcItem extends StatelessWidget {
  const _CalcItem({
    required this.icon,
    required this.onPressed,
  });

  final Icon icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      icon: icon,
    );
  }
}

class CalcState extends ChangeNotifier {
  int counter = 0;
  static int total = 0;

  void increment() {
    if (counter < 99 && total < 99) {
      counter++;
      total++;
      notifyListeners();
    }
  }

  void decrement() {
    if (counter > 0 && total > 0) {
      counter--;
      total--;
      notifyListeners();
    }
  }
}
