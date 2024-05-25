import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hasta_takip/router/screens.dart';
import 'package:hasta_takip/ui_kit/style/gap.dart';
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
    player.stop();
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

  @override
  void dispose() {
    player.stop();
    player.dispose();
    timer?.cancel();
    super.dispose();
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
    context.pushNamed(Screens.cameraPage.name);

/*    player.play(AssetSource('audio/alarm1.mp3'));
    player.setVolume(1);
    //_audioCache.play('alarm.mp3', volume: 1);*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sara"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Visibility(
                visible: !hasFallen,
                child: const Text(
                  "Düşme Yok \n :)",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              ),
              Visibility(
                visible: (hasFallen & !contactAuthorities),
                child: const Text(
                  'Düşme var \n İyi misin?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              ),
              Gap.verXXL,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                      visible: (hasFallen & !contactAuthorities),
                      child: SizedBox(
                        width: 200,
                        height: 100,
                        child: ElevatedButton(
                            onPressed: resetApp,
                            // style: ButtonStyle(
                            //     backgroundColor: MaterialStateProperty.all<Color>(
                            //         Colors.green),
                            //     shadowColor: MaterialStateProperty.all<Color>(
                            //       Colors.green.withOpacity(0.5),
                            //     ),
                            //     fixedSize: MaterialStateProperty.all<Size>(
                            //         const Size(200, 400))),
                            child: const Text("EVET",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30))),
                      )),
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
                  visible: (hasFallen & !contactAuthorities),
                  child: const Text(
                    'Yardım için iletişime geçiliyor...',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    textAlign: TextAlign.center,
                  )),
              Gap.verLG,
              Visibility(
                  visible: (hasFallen & !contactAuthorities),
                  child: buildTime()),
              Visibility(
                  visible: contactAuthorities,
                  child: const Text(
                    'İlk Yardım Telkinleri Başlatılıyor...',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    textAlign: TextAlign.center,
                  )),
              Gap.verLG,
              Visibility(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                      visible: (contactAuthorities),
                      child: SizedBox(
                        width: 150,
                        height: 100,
                        child: ElevatedButton(
                            onPressed: makeNoise,
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue),
                                shadowColor: MaterialStateProperty.all<Color>(
                                  Colors.green.withOpacity(0.5),
                                ),
                                fixedSize: MaterialStateProperty.all<Size>(
                                    const Size(180, 400))),
                            child: const Text(
                              "Video Kaydet",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                              textAlign: TextAlign.center,
                            )),
                      )),
                  const SizedBox(width: 9),
                  Visibility(
                    visible: (contactAuthorities),
                    child: SizedBox(
                      width: 150,
                      height: 100,
                      child: ElevatedButton(
                          onPressed: () {
                            resetApp();
                            context.goNamed(Screens.home.name);
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red),
                              shadowColor: MaterialStateProperty.all<Color>(
                                  Colors.red.withOpacity(0.5)),
                              fixedSize: MaterialStateProperty.all<Size>(
                                  const Size(180, 400))),
                          child: const Text(
                            "İptal",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          )),
                    ),
                  )
                ],
              )),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap.horXXL,
            // FloatingActionButton.large(
            //   backgroundColor: Colors.grey[400],
            //   heroTag: "+",
            //   onPressed: () {
            //     if (!contactAuthorities & !hasFallen) {
            //       fallTrigger();
            //     } else {
            //       print("RESET APP REQUIRED");
            //     }
            //   },
            //   tooltip: 'Düşme var',
            //   child: const Icon(Icons.add),
            // ),
            // FloatingActionButton.large(
            //   backgroundColor: Colors.grey[400],
            //   heroTag: "reset",
            //   onPressed: resetApp,
            //   tooltip: 'İptal',
            //   child: const Icon(Icons.loop),
            // ),
            FloatingActionButton.large(
              backgroundColor: Colors.white,
              heroTag: "yeni",
              onPressed: tekrar,
              tooltip: 'yeni',
              child: const Icon(Icons.home_filled),
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
    context.goNamed(Screens.home.name);
  }
}
