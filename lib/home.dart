import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/player/youtube_player.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Youtube Player"),
      ),
      body: SafeArea(
        child: Column(
          children: const  [
            Expanded(
              child: YoutubePlayer(),
            )
          ],
        ),
      ),
    );
  }
}
