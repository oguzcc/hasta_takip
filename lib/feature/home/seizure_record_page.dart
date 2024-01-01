import 'package:flutter/material.dart';
import 'package:hasta_takip/core/util/extension/context_ext.dart';
import 'package:hasta_takip/ui_kit/style/gap.dart';

class SeizureRecordPage extends StatelessWidget {
  const SeizureRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Icon(Icons.play_circle_fill_outlined, size: 50),
        toolbarHeight: 100,
      ),
      body: ListView(
        children: const [
          _RecordTile(
            date: '12/12/2023',
            seconds: '54 saniye',
          ),
          _RecordTile(
            date: '12/12/2023',
            seconds: '102 saniye',
          ),
          _RecordTile(
            date: '12/12/2023',
            seconds: '12 saniye',
          ),
        ],
      ),
    );
  }
}

class _RecordTile extends StatelessWidget {
  const _RecordTile({
    required this.date,
    required this.seconds,
  });

  final String date;
  final String seconds;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(Icons.play_circle_fill_outlined, size: 50),
          ),
          Gap.horLG,
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(date, style: context.textTheme.title2Medium),
              Text(seconds, style: context.textTheme.title3Medium),
            ],
          ),
        ],
      ),
    );
    // return ListTile(
    //   leading: const Card(
    //     child: Icon(Icons.play_circle_fill_outlined, size: 40),
    //   ),
    //   title: Text(date, style: context.textTheme.title2Medium),
    //   subtitle: Text(time, style: context.textTheme.title3Medium),
    //   onTap: () {},
    // );
  }
}
