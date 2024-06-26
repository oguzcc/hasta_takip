import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hasta_takip/core/util/extension/context_ext.dart';
import 'package:hasta_takip/router/screens.dart';
import 'package:hasta_takip/ui_kit/style/gap.dart';

import '../../../ui_kit/style/app_padding.dart';
import '../../../ui_kit/style/app_radius.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Profil')),
        body: Padding(
          padding: AppPadding.defaultColumnPadding,
          child: const Column(
            children: [
              // const Expanded(child: _ProfileTop()),
              // Gap.verMD,
              Expanded(
                flex: 4,
                child: _ProfileBottom(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileTop extends StatelessWidget {
  const _ProfileTop();

  @override
  Widget build(BuildContext context) {
    String? name;
    String? email;
    String? photoUrl;

    return Column(
      children: [
        Text(name ?? ''),
        _ProfilePhoto(photoUrl: photoUrl),
        Text(email ?? ''),
      ],
    );
  }
}

class _ProfilePhoto extends StatelessWidget {
  const _ProfilePhoto({required this.photoUrl});

  final String? photoUrl;

  @override
  Widget build(BuildContext context) {
    final dimen = context.dynamicWidth(0.1);
    return ClipRRect(
        borderRadius: AppRadius.chip(),
        child: CircleAvatar(
          backgroundColor: Colors.amber,
          radius: dimen / 1.5,
          child: Icon(
            Icons.person,
            size: dimen,
            color: Colors.white,
          ),
        ));
  }
}

class _ProfileBottom extends StatelessWidget {
  const _ProfileBottom();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _ProfileSection(
          profileTiles: [
            _ProfileTile(
              prefixIcon: Icons.person_outline_outlined,
              title: 'Kullanıcı Bilgileri',
              onTap: () {
                context.pushNamed(Screens.patientInfo2.name);
              },
            ),
            _ProfileTile(
              prefixIcon: Icons.notification_important_outlined,
              title: 'Bildirimler',
              onTap: () {},
            ),
            _ProfileTile(
              prefixIcon: Icons.save_alt_outlined,
              title: 'Yayınlanan Makaleler',
              isLast: true,
              onTap: () {},
            ),
            _ProfileTile(
              prefixIcon: Icons.chat_bubble_outline_outlined,
              title: 'Chat',
              onTap: () {
                context.pushNamed(Screens.chat.name);
              },
            ),
          ],
        ),
        Gap.verMD,
        _ProfileSection(
          profileTiles: [
            _ProfileTile(
              prefixIcon: Icons.comment,
              title: 'Sık Sorulan Sorular',
              onTap: () {
                context.pushNamed(Screens.faq.name);
              },
            ),
            _ProfileTile(
              prefixIcon: Icons.info_outlined,
              title: 'Hakkımızda',
              isLast: true,
              onTap: () {
                context.pushNamed(Screens.aboutUs.name);
              },
            ),
          ],
        ),
        Gap.verMD,
        // Button.filled(
        //   onPressed: () {
        //     context.pushNamed(Screens.home.name);
        //   },
        //   title: 'Ana Sayfa',
        // ),
      ],
    );
  }
}

class _ProfileSection extends StatelessWidget {
  const _ProfileSection({required this.profileTiles});

  final List<_ProfileTile> profileTiles;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: AppPadding.defaultColumnPadding,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: AppRadius.card(),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: profileTiles,
        ),
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  const _ProfileTile({
    required this.prefixIcon,
    required this.title,
    this.isLast = false,
    this.onTap,
  });

  final IconData prefixIcon;
  final String title;
  final VoidCallback? onTap;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: isLast ? null : const BoxDecoration(),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 4),
        onTap: onTap,
        leading: Icon(
          prefixIcon,
          color: Colors.black,
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.black,
        ),
        title: Text(title, style: context.text.bodyMedium),
      ),
    );
  }
}
