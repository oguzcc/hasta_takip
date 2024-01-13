import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hasta_takip/feature/home/camera_page.dart';
import 'package:hasta_takip/feature/home/home_page.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class Sara2 extends StatefulWidget {
  const Sara2({Key? key}) : super(key: key);

  @override
  State<Sara2> createState() => _Sara2State();
}

class _Sara2State extends State<Sara2> {
  static const countdownDuration = Duration(seconds: 10);
  var seconds = 10;
  Duration duration = const Duration(seconds: 10);
  Timer? timer;
  bool hasFallen = false;
  bool isCountDown = true;
  bool contactAuthorities = false;
  //late final AudioCache _audioCache;
  final player = AudioPlayer();
  @override
  void initState() {
    super.initState();
    WakelockPlus.enable();
    player.setReleaseMode(ReleaseMode.stop);
    /*_audioCache = AudioCache(
      prefix: 'assets/audio/',
      fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP),
    );*/
    hasFallen = false;
    isCountDown = true;
    contactAuthorities = false;
    resetTimer();
    //player.play(AssetSource('audio/alarm.mp3'));
    player.stop();
    fallTrigger();
  }

  void startTimer() {
    setState(() {
      timer = Timer.periodic(const Duration(seconds: 1), (_) => decrement());
    });
  }

  void decrement() {
    setState(() {
      if (isCountDown) {
        seconds = duration.inSeconds - 1;
        print('Duration: $seconds');
        if (seconds < 0) {
          confirmedFall();
        } else {
          duration = Duration(seconds: seconds);
        }
      }
    });
  }

  void resetTimer() {
    timer?.cancel();
    duration = countdownDuration;
  }

  void resetApp() {
    setState(() {
      hasFallen = false;
      isCountDown = true;
      contactAuthorities = false;
      resetTimer();
      //player.play(AssetSource('audio/alarm.mp3'));
      player.stop();
      //_audioCache.play("alarm.mp3", volume: 0);
    });
  }

  //Function used when accelerometer data indicates possibility of fall.
  //Proceeds to prompt user if a fall occurred.
  void fallTrigger() {
    setState(() {
      hasFallen = true;
      startTimer();
    });
  }

  void confirmedFall() {
    setState(() {
      player.play(AssetSource('audio/alarm1.mp3'));
      contactAuthorities = true;
      isCountDown = false;
      hasFallen = true;
      resetTimer();
    });
  }

  void makeNoise() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CameraPage(),
      ),
    );

/*    player.play(AssetSource('audio/alarm1.mp3'));
    player.setVolume(1);
    //_audioCache.play('alarm.mp3', volume: 1);*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("sara"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Visibility(
                  child: const Text("Düşme Yok \n :)",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
                  visible: !hasFallen),
              Visibility(
                child: const Text('Düşme var \n İyi misin?',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
                visible: (hasFallen & !contactAuthorities),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                      child: ElevatedButton(
                          child: const Text("EVET",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 50)),
                          onPressed: resetApp,
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green),
                              shadowColor: MaterialStateProperty.all<Color>(
                                Colors.green.withOpacity(0.5),
                              ),
                              fixedSize: MaterialStateProperty.all<Size>(
                                  const Size(200, 400)))),
                      visible: (hasFallen & !contactAuthorities)),
                  const SizedBox(
                    width: 9,
                  ),
/*                   Visibility(
                    child: ElevatedButton(
                        child: const Text("Hayır",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 50)),
                        onPressed: confirmedFall,
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                            shadowColor: MaterialStateProperty.all<Color>(
                                Colors.red.withOpacity(0.5)),
                            fixedSize: MaterialStateProperty.all<Size>(
                                const Size(200, 400)))),
                    visible: (hasFallen & !contactAuthorities),
                  ) */
                ],
              ),
              Visibility(
                  child: const Text(
                    'Yardım için iletişime geçiliyor...',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  visible: (hasFallen & !contactAuthorities)),
              Visibility(
                  child: buildTime(),
                  visible: (hasFallen & !contactAuthorities)),
              Visibility(
                  child: const Text('Yardım Yolda',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                  visible: contactAuthorities),
              Visibility(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                      child: ElevatedButton(
                          child: const Text("SES",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 50)),
                          onPressed: makeNoise,
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                              shadowColor: MaterialStateProperty.all<Color>(
                                Colors.green.withOpacity(0.5),
                              ),
                              fixedSize: MaterialStateProperty.all<Size>(
                                  const Size(180, 400)))),
                      visible: (contactAuthorities)),
                  const SizedBox(
                    width: 9,
                  ),
                  Visibility(
                    child: ElevatedButton(
                        child: const Text("İptal",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                            )),
                        onPressed: resetApp,
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                            shadowColor: MaterialStateProperty.all<Color>(
                                Colors.red.withOpacity(0.5)),
                            fixedSize: MaterialStateProperty.all<Size>(
                                const Size(180, 400)))),
                    visible: (contactAuthorities),
                  )
                ],
              )),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: "+",
              onPressed: () {
                if (!contactAuthorities & !hasFallen) {
                  fallTrigger();
                } else {
                  print("RESET APP REQUIRED");
                }
              },
              tooltip: 'Düşme var',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              heroTag: "reset",
              onPressed: resetApp,
              tooltip: 'İptal',
              child: const Icon(Icons.loop),
            ),
            FloatingActionButton(
              heroTag: "yeni",
              onPressed: tekrar,
              tooltip: 'yeni',
              child: const Icon(Icons.access_time),
            )
          ],
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget buildTime() {
    return Text('${duration.inSeconds}', style: const TextStyle(fontSize: 40));
  }

  void tekrar() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }
}
