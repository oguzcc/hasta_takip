import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hasta_takip/router/screens.dart';
import 'package:hasta_takip/ui_kit/widget/button/button.dart';
import 'package:hasta_takip/ui_kit/widget/input/input.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Kayıt Ekranı'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Input.name(controller: firstNameController),
                const SizedBox(height: 16),
                Input.name(controller: lastNameController, isFirstName: false),
                const SizedBox(height: 16),
                const _Gender(),
                const SizedBox(height: 16),
                const _BirthDay(),
                const SizedBox(height: 16),
                Button.filled(
                    onPressed: () {
                      context.goNamed(Screens.home.name);
                    },
                    title: 'Kayıt Ol')
              ],
            ),
          ),
        ));
  }
}

class _BirthDay extends StatefulWidget {
  const _BirthDay({
    super.key,
  });

  @override
  State<_BirthDay> createState() => _BirthDayState();
}

class _BirthDayState extends State<_BirthDay> {
  String birthDay = '1900-01-01';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
            onPressed: () async {
              DateTime? newDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (newDate != null) {
                birthDay = newDate.toString().substring(0, 10);
                setState(() {});
              }
            },
            child: const Text('Doğum Tarihi Seç')),
        const SizedBox(width: 16),
        Text(birthDay),
      ],
    );
  }
}

class _Gender extends StatefulWidget {
  const _Gender();

  @override
  State<_Gender> createState() => _GenderState();
}

class _GenderState extends State<_Gender> {
  String dropValue = 'Erkek';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: const [
        DropdownMenuItem(
          value: 'Erkek',
          child: Text('Erkek'),
        ),
        DropdownMenuItem(
          value: 'Kadın',
          child: Text('Kadın'),
        ),
      ],
      onChanged: (value) {
        dropValue = value as String;
        setState(() {});
      },
      value: dropValue,
    );
  }
}
