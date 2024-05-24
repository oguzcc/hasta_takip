import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:hasta_takip/core/util/extension/context_ext.dart';
import 'package:hasta_takip/ui_kit/style/gap.dart';

class MesajPage extends StatelessWidget {
  late Query _databaseReference =
      FirebaseDatabase.instance.ref().child('lastVideo');
  late DatabaseReference databaseReference2 =
      FirebaseDatabase.instance.ref().child('lastVideo').child('son');
  final String phoneNumber = "00905528246670"; // Hedef telefon numarası
  final String message =
      "__BROŞ___ Merhabalar. şu an sara nöbeti geçirmekteyim. konumum: http://maps.google.com/maps?q=40.7428734,30.3350489"; // Gönderilecek mesaj
  MesajPage({super.key});

  void initState() {
    _databaseReference = FirebaseDatabase.instance.ref().child('lastVideo');
    databaseReference2 =
        FirebaseDatabase.instance.ref().child('lastVideo').child('son');
  }

  void _sendSMS() async {
    List<String> recipents = [phoneNumber];
    String result = await sendSMS(message: message, recipients: recipents)
        // ignore: body_might_complete_normally_catch_error
        .catchError((onError) {
      debugPrint(onError);
    });

    debugPrint(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _databaseReference.onValue,
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Hata: ${snapshot.error}');
          } else {
            // Verileri al ve ListView.builder ile listele
            Map<dynamic, dynamic>? videos =
                snapshot.data!.snapshot.value as Map<dynamic, dynamic>?;

            videos?.forEach((key, video) {
              if (video['Mesaj']) {
                _sendSMS();
              }
            });

            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Gap.verLG,
                    ElevatedButton(
                      onPressed: () async {
                        databaseReference2.update({'Mesaj': false});
                      },
                      child: const Text('KAYITLI KİŞİYE SMS AT'),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class _MesajPageTile extends StatelessWidget {
  const _MesajPageTile(this.title);

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
