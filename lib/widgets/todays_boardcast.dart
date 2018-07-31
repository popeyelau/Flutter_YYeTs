import 'package:flutter/material.dart';
import 'package:yyets/models/tv_schedule.dart';
import 'package:yyets/pages/video.dart';
import 'package:yyets/widgets/tag.dart';

class TodaysBoardcast extends StatelessWidget {
  final List<TVSchedule> schedules;

  const TodaysBoardcast({Key key, this.schedules}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: schedules.length,
        itemBuilder: (context, index) {
          final item = schedules[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (conext) => VideoPage(
                        id: item.id,
                        poster: item.poster,
                        title: item.cnname,
                      )));
            },
            child: Card(
              margin: EdgeInsets.zero,
              child: GridTile(
                child: Hero(
                  tag: item.poster,
                  child: FadeInImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(item.poster),
                    placeholder: AssetImage(
                      "assets/images/placeholder.png",
                    ),
                  ),
                ),
                header: GridTileBar(
                  leading: item.statusCn.isNotEmpty
                      ? Tag(
                          text: item.statusCn,
                          color: Colors.white,
                          backgroudColor:
                              Theme.of(context).primaryColorDark.withAlpha(200),
                        )
                      : Container(),
                ),
                footer: Container(
                  height: 40.0,
                  child: GridTileBar(
                    title: Text(
                      item.cnname,
                      style: TextStyle(fontSize: 12.0),
                    ),
                    backgroundColor: Colors.black.withAlpha(120),
                    subtitle: Text(
                        "S${item.season.padLeft(2, '0')}E${item.episode.padLeft(2, '0')}",
                        style: TextStyle(color: Colors.white, fontSize: 12.0)),
                  ),
                ),
              ),
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.2,
            crossAxisCount: 1,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 8.0),
      ),
    );
  }
}
