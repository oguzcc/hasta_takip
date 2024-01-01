part of '../button.dart';

class _BtnFilled extends StatelessWidget {
  const _BtnFilled({
    required this.onPressed,
    required this.title,
    this.visualDensity,
  });

  final VoidCallback? onPressed;
  final String title;
  final VisualDensity? visualDensity;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(visualDensity: visualDensity),
      child: Text(title),
    );
  }
}

class _BtnFilledIcon extends StatelessWidget {
  const _BtnFilledIcon({
    required this.onPressed,
    required this.title,
    required this.icon,
    this.visualDensity,
  });

  final VoidCallback? onPressed;
  final VisualDensity? visualDensity;
  final String title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      style: FilledButton.styleFrom(
        padding: AppPadding.btnIcon,
        visualDensity: visualDensity,
      ),
      onPressed: onPressed,
      label: Text(title),
      icon: icon,
    );
  }
}

class _BtnOpacity extends StatelessWidget {
  const _BtnOpacity({
    required this.onPressed,
    required this.title,
  });

  final VoidCallback? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(title),
    );
  }
}

class _BtnOpacityIcon extends StatelessWidget {
  const _BtnOpacityIcon({
    required this.onPressed,
    required this.title,
    required this.icon,
    this.visualDensity,
  });

  final VoidCallback? onPressed;
  final VisualDensity? visualDensity;
  final String title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: AppPadding.btnIcon,
        visualDensity: visualDensity,
      ),
      onPressed: onPressed,
      label: Text(title),
      icon: icon,
    );
  }
}

class _BtnPlainAppBar extends StatelessWidget {
  const _BtnPlainAppBar({
    required this.onPressed,
    required this.title,
  });

  final VoidCallback? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        foregroundColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return context.color.systemColorGrayLight;
          }
          return context.color.labelMintPrimary;
        }),
      ),
      child: Text(
        title,
        style: context.textTheme.headlineRegular,
        textAlign: TextAlign.end,
      ),
    );
  }
}

class _BtnPlain extends StatelessWidget {
  const _BtnPlain({
    required this.onPressed,
    required this.title,
  });

  final VoidCallback? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: context.textTheme.buttonTextLarge?.copyWith(
          color: context.colorScheme.primary,
        ),
      ),
    );
  }
}

class _BtnPlainIcon extends StatelessWidget {
  const _BtnPlainIcon({
    required this.onPressed,
    required this.title,
    required this.icon,
  });

  final VoidCallback? onPressed;
  final String title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        padding: AppPadding.btnIcon,
      ),
      onPressed: onPressed,
      icon: icon,
      label: Text(title),
    );
  }
}

class _BtnPlainSec extends StatelessWidget {
  const _BtnPlainSec({
    required this.onPressed,
    required this.title,
  });

  final VoidCallback? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: style(btnColors(plainSecColors)),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}

class _BtnPlainSecIcon extends StatelessWidget {
  const _BtnPlainSecIcon({
    required this.onPressed,
    required this.title,
    required this.icon,
  });

  final VoidCallback? onPressed;
  final String title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: style(btnColors(plainSecColors)),
      onPressed: onPressed,
      icon: icon,
      label: Text(title),
    );
  }
}

class _BtnFilledCancel extends StatelessWidget {
  const _BtnFilledCancel({
    required this.onPressed,
    required this.title,
    this.isRed,
  });

  final VoidCallback? onPressed;
  final String title;
  final bool? isRed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: isRed ?? false
            ? context.color.systemColorRedLightTeartly
            : context.color.buttonsBgColorOpacityDefault,
        foregroundColor: isRed ?? false
            ? context.color.systemColorRedLightPrimary
            : context.color.buttonsTextColorOpacityPrimary,
      ),
      child: Text(title),
    );
  }
}

class _BtnOrder extends StatelessWidget {
  const _BtnOrder({
    required this.onPressed,
    required this.left,
    required this.center,
    required this.right,
    this.isLoading = false,
  });
  final VoidCallback onPressed;
  final String left;
  final String center;
  final String right;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: isLoading
          ? null
          : () {
              onPressed();
              FocusScope.of(context).unfocus();
            },
      child: isLoading
          ? const LoadingIndicator.center()
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(left, style: context.textTheme.calloutMedium),
                Text(center, style: context.textTheme.buttonTextLarge),
                Text(right, style: context.textTheme.calloutMedium),
              ],
            ),
    );
  }
}

class _AppleButton extends StatelessWidget {
  const _AppleButton();

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      style: FilledButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        disabledBackgroundColor: const Color(0x66000000),
        disabledForegroundColor: Colors.white,
      ),
      onPressed: () {},
      label: const Text('Continue with Apple'),
      icon: SvgIcon.apple(),
    );
  }
}

class _GoogleButton extends StatelessWidget {
  const _GoogleButton();

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: IconButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        disabledBackgroundColor: Colors.white,
        side: const BorderSide(color: Color(0xFFCFD4DC)),
      ),
      onPressed: () {},
      label: const Text('Continue with Google'),
      icon: SvgIcon.google(),
    );
  }
}

class _FacebookButton extends StatelessWidget {
  const _FacebookButton();
  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      style: FilledButton.styleFrom(
        backgroundColor: const Color(0xff1877f2),
        foregroundColor: Colors.white,
        disabledBackgroundColor: const Color(0x661877f2),
        disabledForegroundColor: Colors.white,
      ),
      onPressed: () {},
      label: const Text('Continue with Facebook'),
      icon: SvgIcon.facebook(),
    );
  }
}
