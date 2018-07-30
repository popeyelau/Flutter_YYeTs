class Comment {
  String id;
  String channel;
  String author;
  ResourceInfo resourceInfo;
  String userpic;
  String source;
  String groupName;
  String good;
  String dateline;
  int goodStatus;
  String channelCn;
  String itemid;
  String replyNum;
  String nickname;
  String content;

  Comment(
      {this.id,
      this.channel,
      this.author,
      this.resourceInfo,
      this.userpic,
      this.source,
      this.groupName,
      this.good,
      this.dateline,
      this.goodStatus,
      this.channelCn,
      this.itemid,
      this.replyNum,
      this.nickname,
      this.content});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    channel = json['channel'];
    author = json['author'];
    resourceInfo = json['resource_info'] != null
        ? new ResourceInfo.fromJson(json['resource_info'])
        : null;
    userpic = json['userpic'];
    source = json['source'];
    groupName = json['group_name'];
    good = json['good'];
    dateline = json['dateline'];
    goodStatus = json['good_status'];
    channelCn = json['channel_cn'];
    itemid = json['itemid'];
    replyNum = json['reply_num'];
    nickname = json['nickname'];
    content = json['content'];
  }
}

class ResourceInfo {
  String cnname;
  String enname;
  String itemupdate;
  String id;
  String poster;
  String posterM;
  String posterB;
  String posterS;

  ResourceInfo(
      {this.cnname,
      this.enname,
      this.itemupdate,
      this.id,
      this.poster,
      this.posterM,
      this.posterB,
      this.posterS});

  ResourceInfo.fromJson(Map<String, dynamic> json) {
    cnname = json['cnname'];
    enname = json['enname'];
    itemupdate = json['itemupdate'];
    id = json['id'];
    poster = json['poster'];
    posterM = json['poster_m'];
    posterB = json['poster_b'];
    posterS = json['poster_s'];
  }
}
