import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hasta_takip/feature/auth/presentation/view/onboarding_page.dart';
import 'package:hasta_takip/feature/auth/presentation/view/splash_page.dart';
import 'package:hasta_takip/feature/home/home_page.dart';
import 'package:hasta_takip/feature/home/patient_info.dart';
import 'package:hasta_takip/feature/home/reminder_page.dart';
import 'package:hasta_takip/feature/home/seizure_record_page.dart';
import 'package:hasta_takip/feature/home/social_network_page.dart';
import 'package:hasta_takip/ui_kit/layout/bottom_navbar_scaffold.dart';

import 'screens.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> homePage =
    GlobalKey<NavigatorState>(debugLabel: 'shell');
final GlobalKey<NavigatorState> patientInfo =
    GlobalKey<NavigatorState>(debugLabel: 'shell');
final GlobalKey<NavigatorState> seizureRecords =
    GlobalKey<NavigatorState>(debugLabel: 'shell');
final GlobalKey<NavigatorState> reminders =
    GlobalKey<NavigatorState>(debugLabel: 'shell');
final GlobalKey<NavigatorState> socialNetwork =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final goRouter = GoRouter(
  initialLocation: Screens.splash.path,
  debugLogDiagnostics: true,
  navigatorKey: rootNavigatorKey,
  routes: [
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: Screens.splash.path,
      name: Screens.splash.name,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: SplashPage(),
      ),
      redirect: (context, state) => Screens.onboarding.path,
    ),
    GoRoute(
      path: Screens.onboarding.path,
      name: Screens.onboarding.name,
      builder: (context, state) => const OnboardingPage(),
    ),
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state, navigationShell) {
        return BottomNavbarScaffold(
          navigationShell: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: homePage,
          routes: [
            GoRoute(
              parentNavigatorKey: homePage,
              path: Screens.home.path,
              name: Screens.home.name,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: HomePage()),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: reminders,
          routes: [
            GoRoute(
              parentNavigatorKey: reminders,
              path: Screens.reminders.path,
              name: Screens.reminders.name,
              builder: (context, state) => const ReminderPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: seizureRecords,
          routes: [
            GoRoute(
              parentNavigatorKey: seizureRecords,
              path: Screens.seizureRecords.path,
              name: Screens.seizureRecords.name,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: SeizureRecordPage()),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: socialNetwork,
          routes: [
            GoRoute(
              parentNavigatorKey: socialNetwork,
              path: Screens.socialNetwork.path,
              name: Screens.socialNetwork.name,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: SocialNetworkPage()),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: patientInfo,
          routes: [
            GoRoute(
              parentNavigatorKey: patientInfo,
              path: Screens.patientInfo.path,
              name: Screens.patientInfo.name,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: PatientInfo()),
            ),
          ],
        ),
      ],
    ),
  ],
);

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }
  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
