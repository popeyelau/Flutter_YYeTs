import 'package:flutter/material.dart';
import 'package:yyets/api/api.dart';
import 'package:yyets/models/article_comment.dart';
import 'package:yyets/models/comment.dart';
import 'package:yyets/widgets/comment_bar.dart';
import 'package:yyets/widgets/comment_listtile.dart';
import 'package:yyets/widgets/empty_view.dart';
import 'package:yyets/widgets/hot_comment_listtile.dart';

class ReplyPage extends StatefulWidget {
  final Comment comment;

  const ReplyPage({Key key, this.comment}) : super(key: key);
  @override
  _ReplyPageState createState() => _ReplyPageState();
}

class _ReplyPageState extends State<ReplyPage> {
  String replayName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("评论详情"),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 50.0),
              child: ListView(
                children: <Widget>[
                  HotCommentListTile(comment: widget.comment),
                  SizedBox(
                    height: 8.0,
                  ),
                  FutureBuilder<List<ArticleReply>>(
                      future: Networking.fetchReplyList(id: widget.comment.id),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<ArticleReply>> snapshot) {
                        if (snapshot.hasData) {
                          return ListView.separated(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              final item = snapshot.data[index];
                              List<Widget> children = [
                                CommentListTile(
                                  avatar: item.authorUserpic,
                                  nickName: item.authorNickname,
                                  dateline: item.dateline,
                                  groupName: item.authorGroupName,
                                  content: item.content,
                                ),
                              ];

                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    replayName = item.authorNickname;
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
                          );
                        } else if (snapshot.hasError) {
                          return FractionallySizedBox(
                              heightFactor: 1.0,
                              child: EmptyView(
                                title: "出错啦!\n${snapshot.error.toString()}",
                              ));
                        }
                        return Center(child: CircularProgressIndicator());
                      })
                ],
              ),
            ),
            Positioned(
                bottom: 0.0,
                right: 0.0,
                left: 0.0,
                child: CommentBar(
                  replayName: replayName,
                )),
          ],
        ),
      ),
    );
  }
}
