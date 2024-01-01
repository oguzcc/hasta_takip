part of '../input.dart';

class _InputVerification extends StatefulWidget {
  const _InputVerification();

  @override
  State<_InputVerification> createState() => _InputVerificationState();
}

class _InputVerificationState extends State<_InputVerification> {
  late final TextEditingController controller1;
  late final TextEditingController controller2;
  late final TextEditingController controller3;
  late final TextEditingController controller4;

  late final List<TextEditingController> controllerList;

  @override
  void initState() {
    super.initState();
    controller1 = TextEditingController()..addListener(() => setState(() {}));
    controller2 = TextEditingController()..addListener(() => setState(() {}));
    controller3 = TextEditingController()..addListener(() => setState(() {}));
    controller4 = TextEditingController()..addListener(() => setState(() {}));
    controllerList = [
      controller1,
      controller2,
      controller3,
      controller4,
    ];
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    super.dispose();
  }

  int count = 0;
  final focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: focusNode,
      onKey: (event) {
        if (event.logicalKey == LogicalKeyboardKey.backspace ||
            event.physicalKey == PhysicalKeyboardKey.backspace) {
          if (count > 0) {
            count--;
            FocusScope.of(context).previousFocus();
            controllerList[count].text = '';
          }
        }
      },
      child: Form(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            4,
            (index) => SizedBox.square(
              dimension: 70.w,
              child: _Input(
                controller: controllerList[index],
                autofocus: true,
                keyboardType: TextInputType.number,
                style: context.textTheme.title2Regular
                    ?.copyWith(color: context.color.labelLightPrimary),
                maxLength: 1,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  counterText: '',
                  contentPadding: EdgeInsets.symmetric(vertical: 24),
                ),
                onChanged: (pin1) {
                  if (pin1.length == 1) {
                    FocusScope.of(context).nextFocus();
                    controllerList[index].text = pin1;
                    count++;
                    if (count == 4) {
                      pageLoadingTransition(context, () {});
                    }
                  }
                },
                onSaved: (pin1) {},
              ),
            ),
          ),
        ),
      ),
    );
  }
}
