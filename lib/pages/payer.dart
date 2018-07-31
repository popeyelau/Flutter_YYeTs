import 'package:flutter/material.dart';
import 'package:yyets/widgets/video_player_view.dart';

class PlayerPage extends StatefulWidget {
  final String title;
  final String cover;
  final String videoUrl;

  const PlayerPage(
      {Key key,
      this.title,
      this.cover,
      this.videoUrl =
          "http://f.us.sinaimg.cn/003whHFKlx07msm6jWwM01040200EQjd0k010.mp4?label=mp4_720p&template=1280x720.28&Expires=1533011716&ssig=LIpeUQDoHe&KID=unistore,video"})
      : super(key: key);

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: OrientationBuilder(
          builder: (context, orientation) {
            final height = orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.35
                : double.infinity;
            return Container(
              padding: EdgeInsets.only(top: 8.0),
              width: double.infinity,
              height: height,
              color: Colors.black,
              child: VideoPlayerView(
                placeholder: widget.cover,
                url: widget.videoUrl,
              ),
            );
          },
        ),
      ),
    );
  }
}
