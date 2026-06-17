import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/character.dart';
import '../services/api_service.dart';
import '../services/hive_service.dart';
import '../widgets/character_card.dart';
import 'character_details_screen.dart';

class CharacterListScreen extends StatefulWidget {
  const CharacterListScreen({super.key});

  @override
  State<CharacterListScreen> createState() =>
      _CharacterListScreenState();
}

class _CharacterListScreenState
    extends State<CharacterListScreen> {
  final ApiService api = ApiService();

  List<Character> characters = [];

  bool loading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    loadCharacters();
  }

  Future<void> loadCharacters() async {
    try {
      final data = await api.getCharacters();

      final box = HiveService().getBox();

      await box.put(
        "cachedCharacters",
        jsonEncode(
          data.map((e) => e.toJson()).toList(),
        ),
      );

      setState(() {
        characters = data;
      });
    } catch (_) {
      final box = HiveService().getBox();

      final cached =
      box.get("cachedCharacters");

      if (cached != null) {
        final List decoded =
        jsonDecode(cached);

        characters = decoded
            .map((e) => Character.fromJson(e))
            .toList();
      } else {
        error = "Brak danych";
      }
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (error != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Rick & Morty"),
        ),
        body: Center(
          child: Text(error!),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Rick & Morty"),
      ),
      body: RefreshIndicator(
        onRefresh: loadCharacters,
        child: ListView.builder(
          itemCount: characters.length,
          itemBuilder: (context, index) {
            final character =
            characters[index];

            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        CharacterDetailsScreen(
                          id: character.id,
                        ),
                  ),
                );
              },
              child: CharacterCard(
                character: character,
              ),
            );
          },
        ),
      ),
    );
  }
}