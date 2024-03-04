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
          const Text('ŞENGÜL YILMAZ'),
          const Text('EYLÜL UYANIŞ YILMAZ'),
          const Text('TARIK CAN KARADENİZ'),
          const Text('Danışman: Mehmet Durmuş'),
        ],
      ),
    );
  }
}
