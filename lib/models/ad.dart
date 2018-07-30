class Ad {
  int adId;
  int adType;
  String pic;
  String click;
  String wh;
  int status;

  Ad({this.adId, this.adType, this.pic, this.click, this.wh, this.status});

  Ad.fromJson(Map<String, dynamic> json) {
    adId = json['adId'];
    adType = json['adType'];
    pic = json['pic'];
    click = json['click'];
    wh = json['wh'];
    status = json['status'];
  }
}
