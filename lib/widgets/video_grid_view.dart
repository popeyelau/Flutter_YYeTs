import 'package:flutter/material.dart';
import 'package:yyets/models/resource.dart';
import 'package:yyets/widgets/video_grid_item.dart';

class VideoGridView extends StatelessWidget {
  final List<Resource> resources;

  const VideoGridView({Key key, this.resources}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(8.0),
      child: GridView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: resources.length,
        itemBuilder: (context, index) {
          return VideoGridItem(resource: resources[index],);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 9 / 18,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0),
      ),
    );
  }
}
