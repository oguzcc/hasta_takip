import 'package:flutter/material.dart';
import 'package:hasta_takip/core/util/extension/context_ext.dart';
import 'package:hasta_takip/ui_kit/style/gap.dart';

class PatientInfo extends StatelessWidget {
  const PatientInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Icon(Icons.person, size: 50),
        toolbarHeight: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _PatientInfoTile('Adi Soyadi'),
            Gap.verSM,
            const _PatientInfoTile('Cinsiyet'),
            Gap.verSM,
            const _PatientInfoTile('Dogum Tarihi'),
            Gap.verSM,
            const _PatientInfoTile('Boy / Kilo'),
            Gap.verSM,
            const _PatientInfoTile('Kan Grubu'),
            Gap.verSM,
            const _PatientInfoTile('E posta'),
            Gap.verSM,
            const _PatientInfoTile('Telefon'),
            Gap.verSM,
            const _PatientInfoTile('Tibbi Gecmisi'),
            Gap.verSM,
            const _PatientInfoTile('Ilaclar'),
          ],
        ),
      ),
    );
  }
}

class _PatientInfoTile extends StatelessWidget {
  const _PatientInfoTile(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: context.textTheme.headlineMedium);
  }
}
