class ArticleComment {
  String id;
  String author;
  String userpic;
  String source;
  String groupName;
  String good;
  String dateline;
  int goodStatus;
  List<ArticleReply> replys;
  String replyNum;
  String nickname;
  String content;

  ArticleComment(
      {this.id,
      this.author,
      this.userpic,
      this.source,
      this.groupName,
      this.good,
      this.dateline,
      this.goodStatus,
      this.replys,
      this.replyNum,
      this.nickname,
      this.content});

  ArticleComment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    author = json['author'];
    userpic = json['userpic'];
    source = json['source'];
    groupName = json['group_name'];
    good = json['good'];
    dateline = json['dateline'];
    goodStatus = json['good_status'];
    if (json['reply_list'] != null) {
      replys = new List<ArticleReply>();
      json['reply_list'].forEach((v) {
        replys.add(new ArticleReply.fromJson(v));
      });
    }
    replyNum = json['reply_num'];
    nickname = json['nickname'];
    content = json['content'];
  }
}

class ArticleReply {
  String author;
  String toUid;
  String toNickname;
  String id;
  String authorNickname;
  String content;
  String replyid;
  String dateline;
  String authorUserpic;
  String authorGroupName;

  ArticleReply(
      {this.author,
      this.toUid,
      this.toNickname,
      this.id,
      this.authorNickname,
      this.content,
      this.replyid,
      this.dateline,
      this.authorUserpic,
      this.authorGroupName});

  ArticleReply.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    toUid = json['to_uid'];
    toNickname = json['to_nickname'];
    id = json['id'];
    authorNickname = json['author_nickname'];
    content = json['content'];
    replyid = json['replyid'];
    dateline = json['dateline'];
    authorUserpic = json['author_userpic'];
    authorGroupName = json['author_group_name'];
  }
}