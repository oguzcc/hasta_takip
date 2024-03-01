import 'package:flutter/material.dart';
import 'package:hasta_takip/core/util/extension/context_ext.dart';
import 'package:hasta_takip/ui_kit/style/gap.dart';

class PatientInfo extends StatelessWidget {
  const PatientInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Icon(Icons.person, size: 40),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const _PatientInfoTile('Adi Soyadi: Epilepsi Hastasi 1'),
                Gap.verSM,
                const _PatientInfoTile('Cinsiyet: Erkek'),
                Gap.verSM,
                const _PatientInfoTile('Dogum Tarihi: 01.01.1990'),
                Gap.verSM,
                const _PatientInfoTile('Boy / Kilo: 180 / 80'),
                Gap.verSM,
                const _PatientInfoTile('Kan Grubu: A+'),
                Gap.verSM,
                const _PatientInfoTile('E posta: epilepsihasta1@gmail.com'),
                Gap.verSM,
                const _PatientInfoTile('Telefon: 0555 555 55 55'),
                Gap.verSM,
                const _PatientInfoTile('Tibbi Gecmisi: Epilepsi'),
                Gap.verSM,
                const _PatientInfoTile('Ilaclar: Depakin, Lamictal'),
              ],
            ),
          ),
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
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(title, style: context.text.bodyLarge),
    ));
  }
}
