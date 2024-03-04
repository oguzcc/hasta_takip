import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:hasta_takip/ui_kit/style/gap.dart';
import 'package:hasta_takip/ui_kit/widget/indicator/loading_indicator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:video_player/video_player.dart';

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
  final String phoneNumber = "00905528246670"; // Hedef telefon numarası
  final String message =
      "Merhabalar. şu an sara nöbeti geçirmekteyim. konumum: http://maps.google.com/maps?q=40.7428734,30.3350489"; // Gönderilecek mesaj

  bool isLoading = false;
  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('video seçiniz ve sms gönderiniz.'),
      ),
      body: Center(
        child: isLoading
            ? const LoadingIndicator.center()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _selectedVideo == null
                      ? const Text('video seçilmedi')
                      : VideoPlayerWidget(_selectedVideo!),
                  ElevatedButton(
                    onPressed: () async {
                      await _pickVideo();
                      changeLoading();
                      await _uploadVideo();
                      changeLoading();
                    },
                    child: const Text('Video seçiniz'),
                  ),
                  // Gap.verLG,
                  // ElevatedButton(
                  //   onPressed: () async {
                  //     setState(() {
                  //       isLoading = true;
                  //     });
                  //     await _uploadVideo();
                  //     setState(() {
                  //       isLoading = false;
                  //     });
                  //   },
                  //   child: const Text('veri tabanına video yükleyiniz.'),
                  // ),
                  Gap.verLG,
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
        debugPrint('***************************************************');
        debugPrint(result.files.single.path.toString());
        setState(() {
          _selectedVideo = file;
        });
        _videoPlayerController = VideoPlayerController.file(_selectedVideo!);
        _videoPlayerController.play();
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
      DatabaseReference databaseReference2 =
          FirebaseDatabase.instance.ref().child('lastVideo').child('son');

      String formattedDate = DateFormat('dd.MM.yyyy').format(now);
      databaseReference.push().set({
        'fileName': fileName,
        'fileURL': fileURL,
        'timestamp': ServerValue.timestamp,
        'sure': '50',
        'date': formattedDate,
      });

      databaseReference2.update({
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
