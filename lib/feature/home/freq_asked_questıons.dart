import 'package:flutter/material.dart';

import '../../../ui_kit/style/app_padding.dart';
import '../../../ui_kit/style/gap.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sık Sorulan Sorular'),
      ),
      body: ListView.separated(
        padding: AppPadding.chip,
        itemBuilder: (context, index) => _FaqCard(
          title: faqContent[index]['title']!,
          subtitle: faqContent[index]['subtitle']!,
        ),
        separatorBuilder: (context, index) => Gap.verMD,
        itemCount: faqContent.length,
      ),
    );
  }
}

class _FaqCard extends StatelessWidget {
  const _FaqCard({
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}

const faqContent = [
  {
    'title': 'Epilepsi nedir?',
    'subtitle':
        'Epilepsi, beyin hücrelerinin anormal elektriksel aktivitesi nedeniyle nöbetlere neden olan bir nörolojik bozukluktur.',
  },
  {
    'title': 'Epilepsi nasıl tedavi edilir?',
    'subtitle':
        'Epilepsi tedavisi, nöbetleri kontrol etmeye yardımcı olmak için ilaçlar, cerrahi, diyet veya cihazlar gibi bir dizi tedavi seçeneğini içerir.',
  },
  {
    'title': 'Epilepsi nöbetleri nasıl durdurulur?',
    'subtitle':
        'Epilepsi nöbetleri durdurulamaz. Ancak, nöbetlerin sıklığını ve şiddetini azaltmak için tedavi edilebilirler.',
  },
  {
    'title': 'Epilepsi nöbeti sırasında ne yapmalı?',
    'subtitle':
        'Epilepsi nöbeti sırasında yapılması gereken en önemli şey, kişinin başını yere çarpmasını önlemektir. Kişiye müdahale etmek için bir doktora danışın.',
  },
  {
    'title': 'Epilepsi nöbeti sonrası ne yapmalı?',
    'subtitle':
        'Epilepsi nöbeti sonrası kişiye yardım etmek için bir doktora danışın. Kişiye yardım etmek için bir doktora danışın.',
  }
];
