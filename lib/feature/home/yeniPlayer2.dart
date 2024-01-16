import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_sms/flutter_sms.dart';

class YeniPlayer2 extends StatefulWidget {
  final String filePath;

  const YeniPlayer2({Key? key, required this.filePath}) : super(key: key);
  @override
  YeniPlayer2State createState() => YeniPlayer2State();
}

class YeniPlayer2State extends State<YeniPlayer2> {
  File? _selectedVideo;
  final picker = ImagePicker();
  DateTime now = DateTime.now();
  late VideoPlayerController _videoPlayerController;
  final String phoneNumber = "00905415436786"; // Hedef telefon numarası
  final String message = "Merhaba, bu bir test SMS'dir."; // Gönderilecek mesaj

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('video seçiniz ve sms gönderiniz.'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _selectedVideo == null
                ? const Text('video seçilmedi')
                : VideoPlayerWidget(_selectedVideo!),
            ElevatedButton(
              onPressed: () async {
                await _pickVideo();
              },
              child: const Text('Video seçiniz'),
            ),
            ElevatedButton(
              onPressed: () async {
                await _uploadVideo();
              },
              child: const Text('veri tabanına video yükleyiniz.'),
            ),
            ElevatedButton(
              onPressed: () async {
                _sendSMS();
              },
              child: const Text('KAYITLI KİŞİYE SMS AT'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickVideo() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.video,
      );

      if (result != null) {
        File file = File(result.files.single.path!);
        setState(() {
          _selectedVideo = file;
        });
        _videoPlayerController = VideoPlayerController.file(_selectedVideo!);
        await _videoPlayerController.play();
      }
    } catch (e) {
      print('Error picking video: $e');
    }
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
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

  Future<void> _uploadVideo() async {
    if (_selectedVideo == null) {
      print('Video seçilmedi');
      return;
    }

    try {
      await Firebase.initializeApp();
      firebase_storage.Reference storageReference = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('videos/${DateTime.now().millisecondsSinceEpoch}.mp4');

      await storageReference.putFile(_selectedVideo!);

      // Dosyanın adını ve yolu alınır
      String fileName = storageReference.name;
      String fileURL = await storageReference.getDownloadURL();

      // Firebase Realtime Database'e kaydedilir
      DatabaseReference databaseReference =
          FirebaseDatabase.instance.ref().child('videos');
      String formattedDate = DateFormat('dd.MM.yyyy').format(now);
      databaseReference.push().set({
        'fileName': fileName,
        'fileURL': fileURL,
        'timestamp': ServerValue.timestamp,
        'sure': '50',
        'date': formattedDate,
      });

      print('Video uploaded to Firebase Storage and Database.');
      const snackBar = SnackBar(
        content: Text('Video veri tabanına yüklendi!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (e) {
      print('Error uploading video: $e');
    }
  }
}

class VideoPlayerWidget extends StatelessWidget {
  final File videoFile;

  const VideoPlayerWidget(this.videoFile, {super.key});

  @override
  Widget build(BuildContext context) {
    try {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          margin: const EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: OverflowBox(
              maxWidth: double.infinity,
              child: VideoPlayerController.file(videoFile).value.isInitialized
                  ? VideoPlayer(
                      VideoPlayerController.file(videoFile),
                    )
                  : Container(),
            ),
          ),
        ),
      );
    } catch (e) {
      print('Error initializing VideoPlayer: $e');
      return const Text('Error playing video');
    }
  }
}
