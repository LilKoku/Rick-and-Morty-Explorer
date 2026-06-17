import 'package:flutter/material.dart';

import '../models/character.dart';
import '../services/api_service.dart';

class CharacterDetailsScreen
    extends StatefulWidget {
  final int id;

  const CharacterDetailsScreen({
    super.key,
    required this.id,
  });

  @override
  State<CharacterDetailsScreen>
  createState() =>
      _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState
    extends State<CharacterDetailsScreen> {
  Character? character;

  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    character = await ApiService()
        .getCharacterDetails(widget.id);

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

    return Scaffold(
      appBar: AppBar(
        title: Text(character!.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(character!.image),

            ListTile(
              title: const Text("Status"),
              subtitle: Text(character!.status),
            ),

            ListTile(
              title: const Text("Species"),
              subtitle: Text(character!.species),
            ),

            ListTile(
              title: const Text("Gender"),
              subtitle: Text(character!.gender),
            ),

            ListTile(
              title: const Text("Origin"),
              subtitle: Text(character!.origin),
            ),

            ListTile(
              title: const Text("Location"),
              subtitle: Text(character!.location),
            ),
          ],
        ),
      ),
    );
  }
}