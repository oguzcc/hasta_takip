import 'package:flutter/material.dart';
import 'package:hasta_takip/feature/home/home_page.dart';
import 'package:hasta_takip/router/show.dart';
import 'package:hasta_takip/ui_kit/style/gap.dart';
import 'package:hasta_takip/ui_kit/widget/button/button.dart';
import 'package:hasta_takip/ui_kit/widget/input/input.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final TextEditingController controller;

  List<String> chatMessages = [
    "Merhaba, nasıl yardımcı olabilirim?",
    "Sorunuzu daha net bir şekilde ifade edebilir misiniz?",
    "Birazdan size yardımcı olacağım.",
  ];

  Future<void> init() async {
    await ReminderNotifier().init();
  }

  int index = 0;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Icon(Icons.people, size: 50),
        actions: [
          IconButton(
              onPressed: () {
                Show.dialog(
                    context,
                    AlertDialog(
                      title: const Text('Uyarı'),
                      content: const Text(
                          'Tüm mesajları silmek istediğinize emin misiniz?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Hayır'),
                        ),
                        TextButton(
                          onPressed: () {
                            ReminderNotifier().deleteChat();
                            Navigator.pop(context);
                          },
                          child: const Text('Evet'),
                        )
                      ],
                    ));
              },
              icon: const Icon(
                Icons.delete_forever_outlined,
                size: 24,
                color: Colors.red,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListenableBuilder(
            listenable: ReminderNotifier(),
            builder: (context, child) {
              return Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        ...List.generate(ReminderNotifier().chat.length,
                            (index) {
                          return index.isEven
                              ? ChatCard(
                                  alingment: Alignment.centerRight,
                                  title: ReminderNotifier().chat[index])
                              : ChatCard(
                                  alingment: Alignment.centerLeft,
                                  title: ReminderNotifier().chat[index]);
                        }),
                      ],
                    ),
                  ),
                  SafeArea(
                      child: Row(
                    children: [
                      Expanded(
                          child: Input.voucher(
                              controller: controller,
                              hint: 'Mesajınızı yazın')),
                      Gap.horXS,
                      Button.filled(
                          onPressed: () {
                            ReminderNotifier().addMessage(controller.text);
                            controller.clear();
                            Future.delayed(const Duration(seconds: 2), () {
                              ReminderNotifier().addMessage(chatMessages[
                                  // Random().nextInt(chatMessages.length - 1)
                                  // TODO: Random olmasını istiyorsanız üstteki satırı kullanın
                                  // TODO: Random olmasını istemiyorsanız alttaki satırı kullanın
                                  index++ % chatMessages.length]);
                            });
                          },
                          title: 'Gönder')
                    ],
                  )),
                ],
              );
            }),
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
