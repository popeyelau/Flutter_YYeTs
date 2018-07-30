class TVSchedule {
  String id;
  String enname;
  String episode;
  String season;
  String cnname;
  String statusCn;
  String poster;
  String posterM;
  String posterB;
  String posterS;
  String playTime;
  String status;

  TVSchedule(
      {this.id,
      this.enname,
      this.episode,
      this.season,
      this.cnname,
      this.statusCn,
      this.poster,
      this.posterM,
      this.posterB,
      this.posterS,
      this.playTime,
      this.status});

  TVSchedule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    enname = json['enname'];
    episode = json['episode'];
    season = json['season'];
    cnname = json['cnname'];
    statusCn = json['status_cn'];
    poster = json['poster'];
    posterM = json['poster_m'];
    posterB = json['poster_b'];
    posterS = json['poster_s'];
    playTime = json['play_time'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['enname'] = this.enname;
    data['episode'] = this.episode;
    data['season'] = this.season;
    data['cnname'] = this.cnname;
    data['status_cn'] = this.statusCn;
    data['poster'] = this.poster;
    data['poster_m'] = this.posterM;
    data['poster_b'] = this.posterB;
    data['poster_s'] = this.posterS;
    data['play_time'] = this.playTime;
    data['status'] = this.status;
    return data;
  }
}
