class LibResource {
  String id;
  String cnname;
  String enname;
  String channel;
  String area;
  String category;
  String tvstation;
  String playStatus;
  String rank;
  String views;
  String score;
  String publishYear;
  String itemupdate;
  String poster;
  String posterB;
  String posterM;
  String posterS;

  LibResource(
      {this.id,
      this.cnname,
      this.enname,
      this.channel,
      this.area,
      this.category,
      this.tvstation,
      this.playStatus,
      this.rank,
      this.views,
      this.score,
      this.publishYear,
      this.itemupdate,
      this.poster,
      this.posterB,
      this.posterM,
      this.posterS});

  LibResource.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cnname = json['cnname'];
    enname = json['enname'];
    channel = json['channel'];
    area = json['area'];
    category = json['category'];
    tvstation = json['tvstation'];
    playStatus = json['play_status'];
    rank = json['rank'];
    views = json['views'];
    score = json['score'];
    publishYear = json['publish_year'];
    itemupdate = json['itemupdate'];
    poster = json['poster'];
    posterB = json['poster_b'];
    posterM = json['poster_m'];
    posterS = json['poster_s'];
  }
}
