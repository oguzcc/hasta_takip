import 'package:flutter/material.dart';
import 'package:hasta_takip/feature/home/home_page.dart';
import 'package:hasta_takip/ui_kit/style/app_padding.dart';
import 'package:hasta_takip/ui_kit/style/gap.dart';

class PatientDetail extends StatefulWidget {
  const PatientDetail({super.key, required this.patientId});

  final String patientId;

  @override
  State<PatientDetail> createState() => _PatientDetailState();
}

class _PatientDetailState extends State<PatientDetail> {
  int index = 0;

  @override
  void initState() {
    super.initState();
    index = int.parse(widget.patientId);
  }

  @override
  Widget build(BuildContext context) {
    final index = int.parse(widget.patientId);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasta Detayı'),
      ),
      body: Padding(
        padding: AppPadding.baseScaffoldPadding,
        child: ListView(
          children: [
            _PatientDetailTile(label: 'İsim', info: patientList[index].name),
            _PatientDetailTile(
                label: 'E posta', info: patientList[index].email),
            _PatientDetailTile(
                label: "Telefon", info: patientList[index].phone),
            _PatientDetailTile(
                label: "Cinsiyet", info: patientList[index].gender),
            _PatientDetailTile(label: "Yaş", info: patientList[index].age),
            _PatientDetailTile(label: "Kilo", info: patientList[index].weight),
            _PatientDetailTile(
                label: "Kan Grubu", info: patientList[index].bloodType),
          ],
        ),
      ),
    );
  }
}

class _PatientDetailTile extends StatelessWidget {
  const _PatientDetailTile({required this.label, required this.info});

  final String label;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap.verMD,
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(label),
        ),
        Card(child: ListTile(title: Text(info))),
      ],
    );
  }
}
