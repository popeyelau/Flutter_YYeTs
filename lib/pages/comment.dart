import 'package:flutter/material.dart';
import 'package:yyets/api/api.dart';
import 'package:yyets/models/article_comment.dart';
import 'package:yyets/widgets/comment_bar.dart';
import 'package:yyets/widgets/comment_listtile.dart';
import 'package:yyets/widgets/empty_view.dart';

class CommentPage extends StatefulWidget {
  final String id;
  final String channel;

  const CommentPage({Key key, this.id, this.channel = "article"})
      : super(key: key);
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  String replayName = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("全部评论"),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 50.0),
              child: FutureBuilder<List<ArticleComment>>(
                future: Networking.fetchArticleComments(
                    id: widget.id, channel: widget.channel),
                builder: (BuildContext context,
                    AsyncSnapshot<List<ArticleComment>> snapshot) {
                  if (snapshot.hasData) {
                    bool hasComment = snapshot.data.length > 0;
                    return hasComment
                        ? ListView.separated(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              final item = snapshot.data[index];
                              final hasReplys = item.replys.length > 0;
                              List<Widget> children = [
                                CommentListTile(
                                  avatar: item.userpic,
                                  nickName: item.nickname,
                                  dateline: item.dateline,
                                  groupName: item.groupName,
                                  content: item.content,
                                ),
                              ];
                              if (hasReplys) {
                                children.addAll(_buildReplys(item.replys));
                              }
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    replayName = item.nickname;
                                  });
                                },
                                child: Column(children: children),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                height: 5.0,
                                color: Colors.grey[200],
                              );
                            },
                          )
                        : FractionallySizedBox(
                            heightFactor: 1.0,
                            child: EmptyView(
                              title: "还没有评论哦.",
                            ));
                  } else if (snapshot.hasError) {
                    return FractionallySizedBox(
                        heightFactor: 1.0,
                        child: EmptyView(
                          title: "出错啦!\n${snapshot.error.toString()}",
                        ));
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: CommentBar(
                replayName: replayName,
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildReplys(List<ArticleReply> replys) {
    return replys
        .map((v) => GestureDetector(
              onTap: () {
                setState(() {
                  replayName = v.authorNickname;
                });
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${v.authorNickname}:",
                      style: TextStyle(color: Colors.blue),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Expanded(child: Text("${v.content}")),
                  ],
                ),
              ),
            ))
        .toList();
  }
}
