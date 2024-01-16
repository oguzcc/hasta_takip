import 'package:flutter/material.dart';
import 'package:hasta_takip/core/util/extension/context_ext.dart';
import 'package:hasta_takip/ui_kit/style/gap.dart';

class ReminderPage extends StatelessWidget {
  const ReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Icon(Icons.notifications, size: 50),
        toolbarHeight: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap.verLG,
            Text(
              'Hatırlatmalar',
              style: context.textTheme.title1Medium,
            ),
            Gap.verLG,
            const Text('• Ilacinizi almayi unutmayin'),
            Gap.verLG,
            const Text('• Gunluk egzersiz yapmayi unutmayin'),
            Gap.verLG,
            const Text('• Yaklasan bir doktor randevunuz var'),
          ],
        ),
      ),
    );
  }
}
