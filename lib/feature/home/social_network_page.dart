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
      body: const Center(child: Text('Social Network Page')),
    );
  }
}
