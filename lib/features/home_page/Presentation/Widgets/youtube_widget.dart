import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:meow_films/features/home_page/domain/entites/movie_entity.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerWidget extends StatelessWidget {
  final MovieEntity modelData1;

  const YoutubePlayerWidget({super.key, required this.modelData1});

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: '${modelData1.video}',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );

    return Center(
      child: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: false,
        progressIndicatorColor: Colors.blueAccent,
      ),
    );
  }
}
