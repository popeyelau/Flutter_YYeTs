class VideoComment {
  String id;
  String author;
  String userpic;
  String source;
  String groupName;
  String good;
  String dateline;
  int goodStatus;
  List<ReplyList> replyList;
  String replyNum;
  String nickname;
  String content;

  VideoComment(
      {this.id,
      this.author,
      this.userpic,
      this.source,
      this.groupName,
      this.good,
      this.dateline,
      this.goodStatus,
      this.replyList,
      this.replyNum,
      this.nickname,
      this.content});

  VideoComment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    author = json['author'];
    userpic = json['userpic'];
    source = json['source'];
    groupName = json['group_name'];
    good = json['good'];
    dateline = json['dateline'];
    goodStatus = json['good_status'];
    if (json['reply_list'] != null) {
      replyList = new List<ReplyList>();
      json['reply_list'].forEach((v) {
        replyList.add(new ReplyList.fromJson(v));
      });
    }
    replyNum = json['reply_num'];
    nickname = json['nickname'];
    content = json['content'];
  }
}

class ReplyList {
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

  ReplyList(
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

  ReplyList.fromJson(Map<String, dynamic> json) {
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