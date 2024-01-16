import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/util/extension/context_ext.dart';
import '../style/app_colors.dart';
import '../style/app_radius.dart';

// final NavBarState navBarState = NavBarState();
final GlobalKey<ScaffoldState> rootScaffoldKey = GlobalKey<ScaffoldState>();

class BottomNavbarScaffold extends StatelessWidget {
  const BottomNavbarScaffold({required this.navigationShell, super.key});
  final StatefulNavigationShell navigationShell;

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    print('navigationShell.currentIndex: ${navigationShell.currentIndex}');
    return Scaffold(
      key: rootScaffoldKey,
      body: navigationShell,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: navigationShell.currentIndex == 2
            ? context.colorScheme.primary
            : const Color(0xFFADB3B5),
        onPressed: () => _onTap(context, 2),
        child: const Icon(
          Icons.play_circle_fill_outlined,
          color: Colors.white,
        ),
      ),
      extendBody: true,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          surfaceTintColor: const Color(0xFFAEB3B5),
          clipBehavior: Clip.antiAlias,
          height: 52.h,
          padding: const EdgeInsets.only(top: 2),
          notchMargin: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavBarItem(
                title: 'Ana Sayfa',
                icon: Icons.home,
                onTap: () => _onTap(context, 0),
                navigationShell: navigationShell,
                currentIndex: 0,
              ),
              BottomNavBarItem(
                title: 'Hatırlatıcı',
                icon: Icons.notifications,
                onTap: () => _onTap(context, 1),
                navigationShell: navigationShell,
                currentIndex: 1,
              ),
              const SizedBox(width: 30),
              BottomNavBarItem(
                title: 'Sosyal Ağ',
                icon: Icons.people,
                onTap: () => _onTap(context, 3),
                navigationShell: navigationShell,
                currentIndex: 3,
              ),
              BottomNavBarItem(
                title: 'Profil',
                icon: Icons.person,
                onTap: () => _onTap(context, 4),
                navigationShell: navigationShell,
                currentIndex: 4,
              ),
            ],
          ),
        ),
      ),
      // AnimatedContainer(
      //   duration: const Duration(milliseconds: 300),
      //   //to hide then bottom navbar when map full screen
      //   // height: 0,
      //   child:
      //   NavigationBar(
      //     selectedIndex: navigationShell.currentIndex,
      //     onDestinationSelected: (int index) => _onTap(context, index),
      //     destinations: <NavigationDestination>[
      //       NavigationDestination(
      //         selectedIcon: const Icon(Icons.restaurant),
      //         icon: const Icon(Icons.restaurant_outlined),
      //         label: Screens.restaurant.name,
      //       ),
      //       NavigationDestination(
      //         selectedIcon: const Icon(Icons.qr_code),
      //         icon: const Icon(Icons.qr_code_outlined),
      //         label: Screens.search.name,
      //       ),
      //       NavigationDestination(
      //         selectedIcon: const Icon(Icons.person_2),
      //         icon: const Icon(Icons.person_2_outlined),
      //         label: Screens.profile.name,
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.navigationShell,
    required this.currentIndex,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final StatefulNavigationShell navigationShell;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: AppRadius.btn(),
      ),
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            height: 32,
            child: Icon(
              icon,
              color: navigationShell.currentIndex == currentIndex
                  ? context.color.labelMintPrimary
                  : context.color.labelLightTeartly,
            ),
          ),
          Expanded(
            child: Text(
              title,
              style: context.textTheme.captionCaption2Medium?.copyWith(
                color: navigationShell.currentIndex == currentIndex
                    ? context.color.labelMintPrimary
                    : context.color.labelLightTeartly,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavBarState extends ValueNotifier<bool> {
  NavBarState() : super(true);

  void open() {
    value = true;
  }

  void close() {
    value = false;
  }
}
