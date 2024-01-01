import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../app/app.dart';
import '../ui_kit/template/loading_overlay.dart';
import '../ui_kit/widget/indicator/drag_handle.dart';

sealed class Show {
  /// shows modal bottom sheet
  static Future<T?> modal<T>(
    BuildContext context,
    Widget child, {
    bool? drag,
    double? radius,
  }) async {
    return showModalBottomSheet<T>(
      showDragHandle: drag ?? true,
      isScrollControlled: true,
      useSafeArea: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(radius ?? 24)),
      ),
      context: context,
      builder: (contex) => child,
    );
  }

  /// shows dialog
  static Future<T?> floatingModal<T>(BuildContext context, Widget child) async {
    return showModalBottomSheet<T>(
      backgroundColor: Colors.transparent,
      elevation: 0,
      isScrollControlled: true,
      useRootNavigator: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (contex) => child,
    );
  }

  static Future<T?> searchModal<T>(BuildContext context, Widget child) async {
    return showModalBottomSheet<T>(
      isScrollControlled: true,
      showDragHandle: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (contex) => child,
    );
  }

  /// shows snack bar in the current context
  static void snack(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Column(
          children: [
            const DragHandle(),
            Text(message),
          ],
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  /// shows snack bar top of everything
  static void snackTop(String message) {
    rootScaffoldMessengerKey.currentState?.hideCurrentSnackBar();
    rootScaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  /// shows snack bar top of everything
  static void snackNotificationPopup(Widget child) {
    rootScaffoldMessengerKey.currentState?.hideCurrentSnackBar();
    rootScaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: child,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(8),
        elevation: 0,
        margin: const EdgeInsets.only(bottom: 600),
      ),
    );
  }

  /// shows dialog
  static Future<T?> dialog<T>(BuildContext context, Widget child) async {
    return showDialog<T>(
      context: context,
      builder: (context) => child,
    );
  }

  /// shows dialog
  static Future<T?> feedback<T>(BuildContext context, Widget child) async {
    return showModalBottomSheet<T>(
      backgroundColor: Colors.transparent,
      elevation: 0,
      isScrollControlled: true,
      useRootNavigator: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (contex) => child,
    );
  }

  static Future<T?> cupertinoModalPopup<T>(
    BuildContext context,
    Widget child,
  ) {
    return showCupertinoModalPopup(
      context: context,
      barrierColor: Colors.black87,
      builder: (context) => child,
    );
  }

  /// shows banner in the current context
  static void banner(BuildContext context, String message) {
    ScaffoldMessenger.of(context).clearMaterialBanners();
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  /// shows banner top of everything
  static void bannerTop(String message) {
    rootScaffoldMessengerKey.currentState?.clearMaterialBanners();
    rootScaffoldMessengerKey.currentState?.showMaterialBanner(
      MaterialBanner(
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              rootScaffoldMessengerKey.currentState
                  ?.hideCurrentMaterialBanner();
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  static void loading(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.white70,
      barrierDismissible: false,
      barrierLabel: 'Loading...',
      pageBuilder: (_, __, ___) {
        return const LoadingOverlay();
      },
    );
  }

  static Future<void> phoneCaller(String phoneNumber) async {
    final launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
