import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hasta_takip/core/util/extension/context_ext.dart';
import 'package:hasta_takip/router/screens.dart';
import 'package:hasta_takip/ui_kit/style/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Query _databaseReference;

  @override
  void initState() {
    super.initState();
    _databaseReference = FirebaseDatabase.instance
        .ref()
        .child('videos')
        .orderByChild('timestamp');
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _InfoCircle(
                        label: IconButton(
                            onPressed: () {
                              context.pushNamed(
                                  Screens.seizureRecordsVideo.name,
                                  pathParameters: {'url': video['fileURL']});
                            },
                            icon: const Icon(Icons.play_circle_fill_outlined))),
                    _InfoCircle(label: Text(video['sure'])),
                    _InfoCircle(label: Text(video['date'])),
                  ],
                ),
              );
            });

            return Scaffold(
              appBar: AppBar(
                title: const Icon(Icons.home, size: 50),
                toolbarHeight: 100,
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Hasta Adi'),
                    Text(
                      'GUNAYDIN',
                      style: context.textTheme.title1Medium,
                    ),
                    Gap.verLG,
                    const Text('Son Nobetiniz'),
                    Gap.verLG,
                    Card(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: videoWidgets.first),
                    ),
                    Gap.verLG,
                    Text(
                      'Hatirlatmalar',
                      style: context.textTheme.title1Medium,
                    ),
                    Gap.verLG,
                    const Text('• Ilacinizi almayi unutmayin'),
                    Gap.verLG,
                    const Text('• Gunluk egzersiz yapmayi unutmayin'),
                    Gap.verLG,
                    const Text('• Yaklasan bir doktor randevunuz var'),
                  ],
                ),
              ),
              floatingActionButton: Stack(
                children: [
                  Positioned(
                    right: 0,
                    bottom: 80,
                    child: FloatingActionButton.large(
                      heroTag: '12312',
                      backgroundColor: Colors.red,
                      shape: const CircleBorder(),
                      onPressed: () => context.pushNamed(Screens.dusme.name),
                      // child: const Icon(
                      //   Icons.arrow_downward,
                      //   color: Colors.white,
                      // ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class _InfoCircle extends StatelessWidget {
  const _InfoCircle({required this.label});

  final Widget label;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.black12,
      radius: 50,
      child: label,
    );
  }
}

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _DrawerTile(
            title: 'Ana Sayfa',
            icon: Icons.home,
            onTap: () => context.goNamed(Screens.home.name),
          ),
          _DrawerTile(
            title: 'Hatırlatmalar',
            icon: Icons.notifications,
            onTap: () => context.goNamed(Screens.reminders.name),
          ),
          _DrawerTile(
              title: 'Nöbet Kayıtlarım',
              icon: Icons.play_circle_fill_outlined,
              onTap: () => context.goNamed(Screens.seizureRecords.name)),
          _DrawerTile(
            title: 'Sosyal Ağ',
            icon: Icons.people,
            onTap: () => context.goNamed(Screens.socialNetwork.name),
          ),
          _DrawerTile(
            title: 'Hasta Bilgileri',
            icon: Icons.person,
            onTap: () => context.goNamed(Screens.patientInfo.name),
          ),
        ],
      ),
    );
  }
}

class _DrawerTile extends StatelessWidget {
  const _DrawerTile({
    required this.title,
    required this.icon,
    this.onTap,
  });
  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}
