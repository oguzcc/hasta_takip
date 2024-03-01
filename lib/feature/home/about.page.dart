import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hakkımızda')),
      body: Column(
        children: [
          Image.asset(
            'assets/image/logo_light.jpeg',
            fit: BoxFit.cover,
          ),
          const Text('Öğrenci Adı 1'),
          const Text('Öğrenci Adı 2'),
          const Text('Öğrenci Adı 3'),
          const Text('Danışman: Mehmet Durmuş'),
        ],
      ),
    );
  }
}
