import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:file_picker/file_picker.dart';
import 'package:video_player/video_player.dart';

class YeniPlayer2 extends StatefulWidget {
  final String filePath;

  const YeniPlayer2({Key? key, required this.filePath}) : super(key: key);
  @override
  _YeniPlayer2State createState() => _YeniPlayer2State();
}

class _YeniPlayer2State extends State<YeniPlayer2> {
  File? _selectedVideo;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Storage Video Upload'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _selectedVideo == null
                ? Text('No video selected.')
                : VideoPlayerWidget(_selectedVideo!),
            ElevatedButton(
              onPressed: () async {
                await _pickVideo();
              },
              child: Text('Pick a Video'),
            ),
            ElevatedButton(
              onPressed: () async {
                await _uploadVideo();
              },
              child: Text('Upload Video to Firebase Storage'),
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
      }
    } catch (e) {
      print('Error picking video: $e');
    }
  }

  Future<void> _uploadVideo() async {
    if (_selectedVideo == null) {
      print('No video selected.');
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
          FirebaseDatabase.instance.reference().child('videos');

      databaseReference.push().set({
        'fileName': fileName,
        'fileURL': fileURL,
        'timestamp': ServerValue.timestamp,
      });

      print('Video uploaded to Firebase Storage and Database.');
    } catch (e) {
      print('Error uploading video: $e');
    }
  }
}

class VideoPlayerWidget extends StatelessWidget {
  final File videoFile;

  VideoPlayerWidget(this.videoFile);

  @override
  Widget build(BuildContext context) {
    try {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          margin: EdgeInsets.all(10),
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
      return Text('Error playing video');
    }
  }
}
