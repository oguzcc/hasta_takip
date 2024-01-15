// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final DatabaseReference _databaseReference =
//       FirebaseDatabase.instance.reference().child('videos');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Video Listesi'),
//       ),
//       body: FutureBuilder<DataSnapshot>(
//         future: _databaseReference
//             .once()
//             .then((snapshot) => snapshot as DataSnapshot),
//         builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const CircularProgressIndicator();
//           } else if (snapshot.hasError) {
//             return Text('Hata: ${snapshot.error}');
//           } else {
//             // Verileri al ve ListView.builder ile listele
//             Object? videos = snapshot.data!.value;
//             List<Widget> videoWidgets = [];
//             videos?.forEach((key, video) {
//               videoWidgets.add(
//                 ListTile(
//                   title: Text(video['fileName']),
//                   subtitle: Text(video['date']),
//                   // İstenilen diğer bilgileri de ekle
//                 ),
//               );
//             });

//             return ListView.builder(
//               itemCount: videoWidgets.length,
//               itemBuilder: (context, index) {
//                 return videoWidgets[index];
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hasta_takip/core/util/extension/context_ext.dart';
import 'package:hasta_takip/router/screens.dart';
import 'package:hasta_takip/ui_kit/style/gap.dart';

class SeizureRecordPage extends StatefulWidget {
  const SeizureRecordPage({super.key});

  @override
  State<SeizureRecordPage> createState() => _SeizureRecordPageState();
}

class _SeizureRecordPageState extends State<SeizureRecordPage> {
  late DatabaseReference _databaseReference;

  @override
  void initState() {
    super.initState();
    _databaseReference = FirebaseDatabase.instance.ref().child('videos');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Listesi'),
      ),
      body: StreamBuilder(
        stream: _databaseReference.onValue,
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Hata: ${snapshot.error}');
          } else {
            // Verileri al ve ListView.builder ile listele
            Map<dynamic, dynamic>? videos =
                snapshot.data!.snapshot.value as Map<dynamic, dynamic>?;

            List<Widget> videoWidgets = [];
            videos?.forEach((key, video) {
              videoWidgets.add(
                _RecordTile(
                  fileUrl: video['fileURL'],
                  date: video['date'],
                  seconds: video['sure'],
                  // İstenilen diğer bilgileri de ekle
                ),
              );
            });

            return ListView.builder(
              itemCount: videoWidgets.length,
              itemBuilder: (context, index) {
                return videoWidgets[index];
              },
            );
          }
        },
      ),
    );
  }
}

class _RecordTile extends StatelessWidget {
  const _RecordTile({this.date, this.seconds, this.fileUrl});

  final String? date;
  final String? seconds;
  final String? fileUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            InkWell(
              onTap: () => context.pushNamed(Screens.seizureRecordsVideo.name,
                  pathParameters: {'url': fileUrl ?? ''}),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(Icons.play_circle_fill_outlined, size: 50),
              ),
            ),
            Gap.horLG,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(date ?? '', style: context.textTheme.title2Medium),
                Text('$seconds s', style: context.textTheme.title3Medium),
              ],
            ),
          ],
        ),
      ),
    );
    // return ListTile(
    //   leading: const Card(
    //     child: Icon(Icons.play_circle_fill_outlined, size: 40),
    //   ),
    //   title: Text(date, style: context.textTheme.title2Medium),
    //   subtitle: Text(time, style: context.textTheme.title3Medium),
    //   onTap: () {},
    // );
  }
}
