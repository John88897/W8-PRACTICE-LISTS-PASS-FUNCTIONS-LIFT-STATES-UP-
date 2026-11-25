import 'package:ex_4/data/jokes.dart';
import 'package:flutter/material.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(MaterialApp(home: JokeScreen()));

class JokeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<JokeScreen> createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  int? _favoriteIndex;
  void onFavClick(int index) {
    setState(() {
      _favoriteIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes"),
      ),
      body: ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) => FavoriteCard(joke: jokes[index], isFavorite: _favoriteIndex == index, onTap:() => onFavClick(index)),
      ),
    );
  }
}
class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    super.key,
    required this.joke,
    required this.isFavorite,
    required this.onTap,
  });

  final Joke joke;
  final bool isFavorite;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  joke.title,
                  style: TextStyle(
                      color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(joke.text),
              ],
            ),
          ),
          IconButton(
            onPressed: onTap,
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
