import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/character.dart';

class ApiService {
  static const String baseUrl =
      "https://rickandmortyapi.com/api";

  Future<List<Character>> getCharacters() async {
    final response = await http.get(
      Uri.parse("$baseUrl/character"),
    );

    if (response.statusCode != 200) {
      throw Exception("Błąd pobierania postaci");
    }

    final data = jsonDecode(response.body);

    return (data["results"] as List)
        .map((e) => Character.fromJson(e))
        .toList();
  }

  Future<Character> getCharacterDetails(int id) async {
    final response = await http.get(
      Uri.parse("$baseUrl/character/$id"),
    );

    if (response.statusCode != 200) {
      throw Exception("Błąd pobierania szczegółów");
    }

    return Character.fromJson(
      jsonDecode(response.body),
    );
  }
}