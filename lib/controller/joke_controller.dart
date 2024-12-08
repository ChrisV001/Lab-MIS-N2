import 'dart:convert';

import 'package:labs2/repo/joke_repo.dart';
import 'package:labs2/models/jokes.dart';

class JokeController {
  final jokeRepo = JokeRepo();

  Future<List<String>> getJokes() async {
    final response = await jokeRepo.getJokes();
    
    return List<String>.from(jsonDecode(response.body));
  }
}