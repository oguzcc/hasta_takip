import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hasta_takip/feature/home/sara2.dart';
import 'package:hasta_takip/router/screens.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class Dusme extends StatefulWidget {
  const Dusme({Key? key}) : super(key: key);

  @override
  State<Dusme> createState() => _DusmeState();
}

class _DusmeState extends State<Dusme> {
  double posX = 180, posY = 350, posZ = 350;
  double posaccX = 180, posaccY = 350, posaccZ = 350;
  double vtoplamAcc = 0;
  double vtoplamGyr = 0;
  double vector = 0.0;

  Future<void> goToSara2() async {
    await Future.delayed(const Duration(seconds: 2), () {
      context.goNamed(Screens.sara2.name);
    });
  }

  @override
  void initState() {
    super.initState();
    goToSara2();
    // uyku moduna geçmesini engelliyor
    WakelockPlus.enable();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("düşme algılama"),
      ),
      body: Center(
        child: Column(
          children: [
            StreamBuilder<UserAccelerometerEvent>(
              stream: SensorsPlatform.instance.userAccelerometerEventStream(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  //// acce
                  posaccX = (snapshot.data!.x);
                  posaccY = (snapshot.data!.y);
                  posaccZ = (snapshot.data!.z);
                  vtoplamAcc =
                      sqrt(pow(posaccX, 2) + pow(posaccY, 2) + pow(posaccZ, 2));
                  vector = double.tryParse(vtoplamAcc.toStringAsFixed(2))!;
                  ///// gyr
                  posX = (snapshot.data!.x);
                  posY = (snapshot.data!.y);
                  posZ = (snapshot.data!.z);
                  vtoplamGyr = sqrt(pow(posX, 2) + pow(posY, 2) + pow(posZ, 2));
                  vtoplamGyr = double.tryParse(vtoplamGyr.toStringAsFixed(2))!;
                  ///////////////////

                  if (vector > 3.5 && vector < 5) {
                    if (vtoplamGyr > 3) {
                      WidgetsBinding.instance.addPostFrameCallback(
                        (_) => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Sara2(),
                          ),
                        ),
                      );
                    }
                  }
                }
                return Text(
                  "$vector",
                  style: const TextStyle(fontSize: 20),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
