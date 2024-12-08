import 'package:flutter/material.dart';
import 'package:labs2/repo/joke_repo.dart';

class JokeCategoryScreen extends StatelessWidget {
  final String category;

  JokeCategoryScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokes: $category"),
      ),
      body: FutureBuilder<List<String>>(
        future: JokeRepo().getJokesByCategory(category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No jokes found for this category.'),
            );
          }

          final jokes = snapshot.data!;

          return ListView.builder(
            itemCount: jokes.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(jokes[index]),
              );
            },
          );
        },
      ),
    );
  }
}

