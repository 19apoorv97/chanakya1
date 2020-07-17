import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/*class YoutubePlayerDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPlayer(),
    );
  }
}*/

/// Homepage
class MyPlayer extends StatefulWidget {
  final String vLink;
  MyPlayer({@required this.vLink});
  @override
  _MyPlayerState createState() => _MyPlayerState();
}

class _MyPlayerState extends State<MyPlayer> {
  YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
    initialVideoId: widget.vLink,
    flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          ),
    );
  }

  void listener() {
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player:YoutubePlayer(
    controller: _controller,
    showVideoProgressIndicator: true,
    progressIndicatorColor: Colors.amber,
    progressColors: ProgressBarColors(
        playedColor: Colors.amber,
        handleColor: Colors.amberAccent,
    ),
    onReady:() {
        _controller.addListener(listener);
    },
),
      builder: (context, player) => Scaffold(
        body: ListView(
          children: [
            player
          ],
        ),
      ),
    );
  }
}