import 'package:flutter/material.dart';
import 'package:yyets/models/video_info.dart';
import 'package:yyets/widgets/tag.dart';

class SeriesListView extends StatelessWidget {
  final SeasonList season;
  final Function callback;

  const SeriesListView({Key key, this.season, this.callback}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 16.0,
          ),
          Tag(
            text: season.seasonCn,
            color: Colors.white,
            border: true,
            backgroudColor: Colors.blue,
          ),
          GridView.builder(
            itemCount: season.episodeList.length,
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final item = season.episodeList[index];
              return GestureDetector(
                onTap: () {
                  callback(item);
                },
                child: Container(
                    child: Card(
                  elevation: 2.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "${item.episode.padLeft(2, '0')}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                        Text(
                          item.playTime,
                          maxLines: 1,
                          style: TextStyle(fontSize: 10.0),
                        )
                      ],
                    ),
                  ),
                )),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 4 / 3,
                crossAxisCount: 4,
                crossAxisSpacing: 8.0),
          ),
        ],
      ),
    );
  }
}
