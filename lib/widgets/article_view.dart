import 'package:flutter/material.dart';
import 'package:yyets/pages/comment.dart';
import 'package:yyets/pages/photo_browser.dart';
import 'package:yyets/widgets/main.dart';
import 'package:yyets/widgets/section_divider.dart';
import 'package:yyets/models/article.dart';
import 'package:yyets/widgets/tag.dart';

class ArticleView extends StatelessWidget {
  final ArticleViewModel vm;

  const ArticleView({Key key, this.vm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          color: Colors.white,
          margin: EdgeInsets.only(bottom: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(vm.avatar),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  vm.author,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Tag(
                                    text: vm.tag,
                                    border: true,
                                    color: Theme.of(context).primaryColor)
                              ],
                            ),
                            Text(
                              vm.time,
                              style: Theme.of(context).textTheme.caption,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              vm.title.isEmpty
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        vm.title,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.display1,
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  vm.content,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.body1,
                ),
              ),
              Container(
                child: _buildContent(context),
              ),
              Divider(
                height: 1.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ActionBar(
                  likes: vm.goodCount,
                  comments: vm.commentsCount,
                  liked: vm.liked,
                  onComment: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CommentPage(
                              id: vm.cid ?? vm.id,
                              channel: vm.tag == "微博" ? "weibo" : "article",
                            )));
                  },
                ),
              ),
            ],
          ),
        ),
        SectionDivider()
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    Widget child = Container();
    if (vm.isVideo) {
      child = VideoPlayerView(
        url: vm.video,
        placeholder: vm.videoCover,
      );
    } else {
      final imageCount = vm.images.length;
      if (imageCount > 0) {
        child = vm.images.length > 1
            ? GridView.builder(
                itemCount: vm.images.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (context) => PhotoBrowser(
                                imageUrls: vm.images,
                                index: index,
                              )));
                    },
                    child: FadeInImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(vm.images[index]),
                      placeholder: AssetImage(
                        "assets/images/placeholder.png",
                      ),
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0),
              )
            : GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (context) => PhotoBrowser(
                            imageUrls: vm.images,
                          )));
                },
                child: Hero(
                  tag: vm.images.first,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: FadeInImage(
                      image: NetworkImage(vm.images.first),
                      fit: BoxFit.cover,
                      placeholder: AssetImage(
                        "assets/images/placeholder.png",
                      ),
                    ),
                  ),
                ),
              );
      }
    }
    return Container(
      child: child,
    );
  }
}
