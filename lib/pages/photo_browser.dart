import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoBrowser extends StatelessWidget {
  final List<String> imageUrls;
  final int index;

  const PhotoBrowser({Key key, this.imageUrls, this.index = 0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: index);
    return Container(
      child: PageView(
        controller: controller,
        children: imageUrls
            .map((v) => GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: PhotoView(
                    imageProvider: NetworkImage(v),
                    minScale: 1.0,
                    loadingChild: Container(),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
