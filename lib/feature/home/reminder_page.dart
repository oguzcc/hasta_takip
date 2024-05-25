import 'package:flutter/material.dart';
import 'package:hasta_takip/core/util/extension/context_ext.dart';
import 'package:hasta_takip/feature/home/home_page.dart';
import 'package:hasta_takip/ui_kit/style/gap.dart';
import 'package:hasta_takip/ui_kit/widget/button/button.dart';
import 'package:hasta_takip/ui_kit/widget/input/input.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReminderPage extends StatefulWidget {
  const ReminderPage({super.key});

  @override
  State<ReminderPage> createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  late final TextEditingController controllerRem;
  late final TextEditingController controllerFreq;
  late SharedPreferences prefs;
  int remindersLength = 0;
  List<String> reminders = [];

  Future<void> init() async {
    ReminderNotifier().init();
    setState(() {});
  }

  @override
  void initState() {
    init();
    super.initState();
    controllerRem = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    controllerFreq = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Icon(Icons.notifications, size: 40),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: ListenableBuilder(
                    listenable: ReminderNotifier(),
                    builder: (context, child) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap.verLG,
                          Text(
                            'Hatırlatmalar.\nNöbet sıklığı: ${ReminderNotifier().freq}',
                            style: context.textTheme.title2SemiBold,
                          ),
                          ...ReminderNotifier()
                              .reminders
                              .map((e) => Column(
                                    children: [
                                      Gap.verXS,
                                      Text(
                                        '• $e',
                                        style: context.text.bodyLarge,
                                      ),
                                    ],
                                  ))
                              .toList(),
                        ],
                      );
                    }),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  Input.voucher(
                      controller: controllerFreq,
                      hint: 'Kriz Sıklığı - Haftada'),
                  Gap.verXS,
                  Input.voucher(
                      controller: controllerRem, hint: 'Hatırlatma ekle'),
                  Gap.verXS,
                  Button.filled(
                          onPressed: () {
                            if (controllerRem.text.isNotEmpty) {
                              ReminderNotifier()
                                  .addReminder(controllerRem.text);
                              controllerRem.clear();
                              setState(() {});
                            }
                            if (controllerFreq.text.isNotEmpty) {
                              ReminderNotifier().setFreq(controllerFreq.text);
                              controllerFreq.clear();
                              setState(() {});
                            }
                          },
                          title: 'Ekle')
                      .fullWidth(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
