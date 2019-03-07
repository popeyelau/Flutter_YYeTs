import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerView extends StatefulWidget {
  final String url;
  final String placeholder;

  const VideoPlayerView({Key key, this.url, this.placeholder})
      : super(key: key);

  @override
  _VideoPlayerViewState createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  bool playing = false;
  VideoPlayerController controller;

  @override
  void initState() {
    controller = VideoPlayerController.network(widget.url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: playing
          ? Chewie(
              controller: ChewieController(
              videoPlayerController: controller,
              showControls: playing,
              aspectRatio: 16 / 9,
              autoPlay: playing,
              looping: false,
              placeholder: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.placeholder))),
              ),
            ))
          : GestureDetector(
              onTap: () {
                setState(() {
                  playing = true;
                  controller.play();
                });
              },
              child: Stack(alignment: Alignment.center, children: <Widget>[
                Image.network(
                  widget.placeholder,
                  fit: BoxFit.cover,
                ),
                Image(
                  fit: BoxFit.cover,
                  width: 60.0,
                  height: 60.0,
                  image: AssetImage("assets/images/play_btn.png"),
                ),
              ]),
            ),
    );
  }
}
