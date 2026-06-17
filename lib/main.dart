import 'package:flutter/material.dart';

import 'screens/character_list_screen.dart';
import 'services/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveService().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick & Morty Explorer',
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        useMaterial3: true,
      ),
      home: const CharacterListScreen(),
    );
  }
}