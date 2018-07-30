class Help {
  String detail;
  String uid;
  String typeCn;
  String resourceCnname;
  String userpic;
  String type;
  String title;
  String resourceid;
  String dateline;
  String lastOpenTime;
  String statusCn;
  String groupName;
  String hid;
  String nickname;
  String commentsCount;
  String status;
  String views;

  Help(
      {this.detail,
      this.uid,
      this.typeCn,
      this.resourceCnname,
      this.userpic,
      this.type,
      this.title,
      this.resourceid,
      this.dateline,
      this.lastOpenTime,
      this.statusCn,
      this.groupName,
      this.hid,
      this.nickname,
      this.commentsCount,
      this.status,
      this.views});

  Help.fromJson(Map<String, dynamic> json) {
    detail = json['detail'];
    uid = json['uid'];
    typeCn = json['type_cn'];
    resourceCnname = json['resource_cnname'];
    userpic = json['userpic'];
    type = json['type'];
    title = json['title'];
    resourceid = json['resourceid'];
    dateline = json['dateline'];
    lastOpenTime = json['last_open_time'];
    statusCn = json['status_cn'];
    groupName = json['group_name'];
    hid = json['hid'];
    nickname = json['nickname'];
    commentsCount = json['comments_count'];
    status = json['status'];
    views = json['views'];
  }
}
