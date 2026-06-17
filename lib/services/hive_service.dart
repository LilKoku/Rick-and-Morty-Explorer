import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static const String boxName = "characters";

  Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(boxName);
  }

  Box getBox() {
    return Hive.box(boxName);
  }
}