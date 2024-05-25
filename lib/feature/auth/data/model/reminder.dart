import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Reminder extends HiveObject {
  @HiveField(0)
  String frequency = '';
  @HiveField(1)
  String description = '';
}
