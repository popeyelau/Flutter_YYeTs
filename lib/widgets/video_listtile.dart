import 'package:flutter/material.dart';
import 'package:yyets/common/utils.dart';
import 'package:yyets/models/lib_resource.dart';
import 'package:yyets/widgets/tag.dart';

class VideoListTile extends StatelessWidget {
  final LibResource resource;

  const VideoListTile({Key key, this.resource}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String date = "";

    int timestap = int.tryParse(resource.itemupdate);
    date =
        timestap == null ? resource.itemupdate : Utils.readTimestamp(timestap);

    return Container(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: resource.poster ?? resource.cnname,
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.contain,
                      image: resource.posterM == null
                          ? AssetImage("assets/images/placeholder.png")
                          : NetworkImage(resource.posterM),
                    )),
                  ),
                ),
              ),
              SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          resource.cnname,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      resource.area.isNotEmpty
                          ? Tag(
                              text: resource.area,
                              color: Theme.of(context).primaryColor,
                              border: true,
                            )
                          : Container(),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        resource.category,
                        style: Theme.of(context).textTheme.body2,
                      ),
                      Text(
                        resource.playStatus,
                        style: Theme.of(context).textTheme.body2,
                      ),
                      Text(
                        date,
                        style: Theme.of(context).textTheme.body2,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 2.0,
                child: Container(
                  width: 60.0,
                  height: 60.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Score"),
                      Text(
                        resource.score,
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}
