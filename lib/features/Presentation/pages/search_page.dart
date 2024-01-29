import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MovieSearchPage extends StatefulWidget {
  const MovieSearchPage({super.key});
  @override
  _MovieSearchPageState createState() => _MovieSearchPageState();
}

class _MovieSearchPageState extends State<MovieSearchPage> {
  List<String> movies = [
    "Inception",
    "The Shawshank Redemption",
    "The Dark Knight",
    "Pulp Fiction",
    "Fight Club",
    "Forrest Gump",
    "The Matrix",
    "The Godfather",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Search'),
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          _buildMovieList(),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: const InputDecoration(
          hintText: 'Search movies...',
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: (query) {},
      ),
    );
  }

  Widget _buildMovieList() {
    return Expanded(
      child: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return _buildMovieCard(movies[index]);
        },
      ),
    );
  }

  Widget _buildMovieCard(String movieTitle) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(8),
      child: ListTile(
        title: Text(movieTitle),
        subtitle: Text('Director: Christopher Nolan'),
        // trailing: _buildHeartAnimation(),
        onTap: () {
          // Handle movie tap
        },
      ),
    );
  }

  // Widget _buildHeartAnimation() {
  //   return RiveAnimation.asset(
  //     'assets/heart.riv',
  //     fit: BoxFit.cover,
  //   );
  // }
}
