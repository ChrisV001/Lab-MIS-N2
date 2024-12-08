import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:developer' as Log;

class JokeRepo {
  Future<http.Response> getJokes() async {
    final url = Uri.parse('https://official-joke-api.appspot.com/types');
    final response = await http.get(url);

    Log.log(response.body);

    return response;
  }
  Future<List<String>> getJokesByCategory(String category) async {
    final url = Uri.parse('https://official-joke-api.appspot.com/jokes/$category/ten');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jokesJson = jsonDecode(response.body);
      return jokesJson.map((joke) => joke['setup'] as String).toList();
    } else {
      throw Exception('Failed to load jokes for category: $category');
    }
  }

  Future<String> getRandomJoke() async {
    final url = Uri.parse('https://official-joke-api.appspot.com/random_joke');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jokeJson = jsonDecode(response.body);
      return "${jokeJson['setup']} - ${jokeJson['punchline']}";
    } else {
      throw Exception('Failed to load random joke');
    }
  }

}