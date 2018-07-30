import 'package:flutter/material.dart';
import 'package:yyets/models/resource.dart';
import 'package:yyets/pages/video.dart';
import 'package:yyets/widgets/tag.dart';

class VideoGridItem extends StatelessWidget {
  final Resource resource;

  const VideoGridItem({Key key, this.resource}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (conext) => VideoPage(
                  id: resource.id,
                  poster: resource.poster,
                  title: resource.cnname,
                )));
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Card(
                elevation: 8.0,
                child: AspectRatio(
                    aspectRatio: 4 / 3,
                    child: Hero(
                      tag: resource.poster,
                      child: FadeInImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(resource.poster),
                        placeholder: AssetImage(
                          "assets/images/placeholder.png",
                        ),
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                resource.cnname,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              resource.playStatus,
              style: Theme.of(context).textTheme.body2,
            ),
            resource.channelCn != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Tag(
                      text: resource.channelCn,
                      color: Theme.of(context).primaryColor,
                      border: true,
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
