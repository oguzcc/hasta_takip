import 'package:flutter/material.dart';

class SocialNetworkPage extends StatelessWidget {
  const SocialNetworkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Icon(Icons.people, size: 50),
        toolbarHeight: 100,
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            ChatCard(title: 'Merhaba', alingment: Alignment.centerLeft),
            ChatCard(title: 'Merhaba', alingment: Alignment.centerRight),
            ChatCard(
                title: 'Bugun daha iyi misiniz?',
                alingment: Alignment.centerLeft),
            ChatCard(
                title: 'Teşekkürler. Siz nasılsınız?',
                alingment: Alignment.centerRight),
            ChatCard(
                title: 'Ben de iyiyim sağolun.',
                alingment: Alignment.centerLeft),
            ChatCard(title: 'Iyiyim sen', alingment: Alignment.centerRight),
          ],
        ),
      ),
    );
  }
}

class ChatCard extends StatelessWidget {
  const ChatCard({super.key, required this.alingment, required this.title});

  final String title;
  final AlignmentGeometry alingment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alingment,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: Text(title),
        ),
      ),
    );
  }
}
