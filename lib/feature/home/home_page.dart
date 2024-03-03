import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hasta_takip/core/util/extension/context_ext.dart';
import 'package:hasta_takip/router/screens.dart';
import 'package:hasta_takip/router/show.dart';
import 'package:hasta_takip/ui_kit/style/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Query _databaseReference;
  late SharedPreferences prefs;
  int remindersLength = 0;
  List<String> reminders = [];

  Future<void> init() async {
    await ReminderNotifier().init();
  }

  @override
  void initState() {
    init();
    super.initState();
    _databaseReference = FirebaseDatabase.instance.ref().child('videos');
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
                            icon: const Icon(Icons.play_circle_fill_outlined,
                                size: 40))),
                    _InfoCircle(label: Text(video['sure'])),
                    _InfoCircle(
                        label:
                            //DateFormat('dd/MM/yyyy').format(DateTime.now()))),
                            Text(video['date'])),
                  ],
                ),
              );
            });

            return Scaffold(
              appBar: AppBar(
                title: const Icon(Icons.home, size: 40),
                actions: [
                  IconButton(
                    onPressed: () async {
                      Show.dialog(
                        context,
                        AlertDialog(
                          title: const Text('Uyarı'),
                          content: const Text('Tüm hatırlatmalar silinecek.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                context.pop();
                              },
                              child: const Text('Hayır'),
                            ),
                            TextButton(
                              onPressed: () {
                                ReminderNotifier().deleteAll();
                                context.pop();
                                setState(() {});
                              },
                              child: const Text('Evet'),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(Icons.delete_forever_outlined,
                        size: 32, color: Colors.red),
                  ),
                ],
              ),
              body: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/bg_light.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListenableBuilder(
                      listenable: ReminderNotifier(),
                      builder: (context, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Epilepsi Hastasi 1'),
                            Text(
                              'GUNAYDIN',
                              style: context.textTheme.title1Medium,
                            ),
                            Gap.verXS,
                            const Text('Son Nobetiniz'),
                            Gap.verXS,
                            Text('Nöbet Sıklığı: ${ReminderNotifier().freq}'),
                            Gap.verXS,
                            Card(
                              color: Colors.transparent,
                              elevation: 0,
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 24.0),
                                  child: videoWidgets.first),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: SafeArea(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Gap.verLG,
                                      Text(
                                        'Hatırlatmalar',
                                        style: context.textTheme.title1Medium,
                                      ),
                                      ...ReminderNotifier()
                                          .reminders
                                          .map((e) => Column(
                                                children: [
                                                  Gap.verXS,
                                                  Text(
                                                    '• $e',
                                                    style:
                                                        context.text.bodyLarge,
                                                  ),
                                                ],
                                              ))
                                          .toList(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
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
      backgroundColor: Colors.white70,
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

class ReminderNotifier extends ChangeNotifier {
  // Singleton
  static final ReminderNotifier _instance = ReminderNotifier._internal();
  factory ReminderNotifier() => _instance;
  ReminderNotifier._internal();

  late SharedPreferences prefs;
  int remindersLength = 0;
  List<String> reminders = [];
  List<String> chat = [];
  String freq = '';

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    reminders = prefs.getStringList('reminders') ?? [];
    freq = prefs.getString('freq') ?? '';
    chat = prefs.getStringList('chat') ?? [];
    notifyListeners();
  }

  void setFreq(String freq) {
    this.freq = freq;
    prefs.setString('freq', freq);
    notifyListeners();
  }

  void addReminder(String reminder) {
    reminders.add(reminder);
    prefs.setStringList('reminders', reminders);
    notifyListeners();
  }

  void deleteReminder(String reminder) {
    reminders.remove(reminder);
    prefs.setStringList('reminders', reminders);
    notifyListeners();
  }

  void addMessage(String message) {
    chat.add(message);
    prefs.setStringList('chat', chat);
    notifyListeners();
  }

  void deleteMessage(String message) {
    chat.remove(message);
    prefs.setStringList('chat', chat);
    notifyListeners();
  }

  void deleteChat() {
    chat.clear();
    notifyListeners();
  }

  void deleteAll() {
    reminders.clear();
    freq = '';
    prefs.clear();
    notifyListeners();
  }
}
