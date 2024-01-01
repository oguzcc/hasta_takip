part of '../button.dart';

class _IconBtn extends StatelessWidget {
  const _IconBtn._({required this.iconBtn});

  factory _IconBtn.like({
    double? size,
    double? iconSize,
    VoidCallback? onTap,
  }) {
    return _IconBtn._(
      iconBtn: _IconBtnWhiteSwitch(
        size: size,
        iconSize: iconSize,
        onTap: onTap,
      ),
    );
  }

  factory _IconBtn.cross({
    double? size,
    double? iconSize,
    VoidCallback? onTap,
  }) {
    return _IconBtn._(
      iconBtn: _IconBtnWhite(
        size: size,
        iconSize: iconSize,
        onTap: onTap,
      ),
    );
  }

  final Widget iconBtn;

  @override
  Widget build(BuildContext context) {
    return iconBtn;
  }
}

class _IconBtnWhiteSwitch extends StatefulWidget {
  const _IconBtnWhiteSwitch({
    this.size,
    this.iconSize,
    this.onTap,
  });

  final double? size;
  final double? iconSize;
  final VoidCallback? onTap;

  @override
  State<_IconBtnWhiteSwitch> createState() => __IconBtnWhiteSwitchState();
}

class __IconBtnWhiteSwitchState extends State<_IconBtnWhiteSwitch> {
  bool selected = false;

  void changeSelected() => setState(() => selected = !selected);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap?.call();
        changeSelected();
      },
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: AnimateSwitch(
          child: SizedBox.square(
            key: ValueKey(selected),
            child: selected
                ? Icon(NyIcons.like_filled, size: widget.iconSize)
                : Icon(NyIcons.like_outlined, size: widget.iconSize),
          ),
        ),
      ),
    );
  }
}

class _IconBtnWhite extends StatelessWidget {
  const _IconBtnWhite({
    this.size,
    this.iconSize,
    this.onTap,
  });

  final double? size;
  final double? iconSize;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () => context.pop(),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: context.color.labelDarkPrimary,
          borderRadius: BorderRadius.circular(100.r),
        ),
        // padding: padding,
        child: Icon(
          NyIcons.cross,
          color: context.color.labelMintPrimary,
          size: iconSize,
        ),
      ),
    );
  }
}

class _BtnRadio extends StatefulWidget {
  const _BtnRadio();

  @override
  State<_BtnRadio> createState() => _BtnRadioState();
}

class _BtnRadioState extends State<_BtnRadio> {
  bool checked = false;
  void changeCheck() {
    setState(() => checked = !checked);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.w,
      height: 24.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        border: Border.all(
          color: context.color.labelMintPrimary,
          width: 1.w,
        ),
      ),
      child: checked
          ? AnimateSwitch(
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: CircleAvatar(
                  backgroundColor: context.color.labelMintPrimary,
                  child: Icon(
                    NyIcons.check,
                    color: context.color.labelDarkPrimary,
                    size: 16.w,
                  ),
                ),
                onPressed: changeCheck,
              ),
            )
          : IconButton(
              icon: const CircleAvatar(
                backgroundColor: Colors.transparent,
              ),
              onPressed: changeCheck,
            ),
    );
  }
}
