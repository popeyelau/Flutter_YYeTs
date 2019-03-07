import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoBrowser extends StatelessWidget {
  final List<String> imageUrls;
  final int index;

  const PhotoBrowser({Key key, this.imageUrls, this.index = 0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: index);
    return Container(
      color: Colors.black12,
      child: Dismissible(
        direction: DismissDirection.down,
        onDismissed: (_) => Navigator.of(context).pop(),
        child: PhotoViewGallery(
          backgroundColor: Colors.black26,
          pageController: controller,
          pageOptions: imageUrls
              .map((url) => PhotoViewGalleryPageOptions(
                    imageProvider: NetworkImage(url),
                    initialScale: PhotoViewComputedScale.contained,
                  ))
              .toList(),
        ),
        key: Key("gallery"),
      ),
    );
  }
}
