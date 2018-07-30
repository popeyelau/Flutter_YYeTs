class Ranks {
  List<Resource> month;
  List<Resource> japan;
  List<Resource> movie;
  List<Resource> total;
  List<Resource> news;
  List<Resource> today;


  Ranks.initialState() {
    month = [];
    japan = [];
    movie = [];
    total = [];
    news = [];
    today = [];
  }

  Ranks.fromJson(Map<String, dynamic> json) {
    if (json['month_list'] != null) {
      month = List<Resource>();
      json['month_list'].forEach((v) {
        month.add(Resource.fromJson(v));
      });
    }
    if (json['japan_list'] != null) {
      japan = List<Resource>();
      json['japan_list'].forEach((v) {
        japan.add(Resource.fromJson(v));
      });
    }

    if (json['movie_list'] != null) {
      movie = List<Resource>();
      json['movie_list'].forEach((v) {
        movie.add(Resource.fromJson(v));
      });
    }
    if (json['total_list'] != null) {
      total = List<Resource>();
      json['total_list'].forEach((v) {
        total.add(Resource.fromJson(v));
      });
    }
    if (json['new_list'] != null) {
      news = List<Resource>();
      json['new_list'].forEach((v) {
        news.add(Resource.fromJson(v));
      });
    }
    if (json['today_list'] != null) {
      today = List<Resource>();
      json['today_list'].forEach((v) {
        today.add(Resource.fromJson(v));
      });
    }
  }
}

class Resource {
  String id;
  String cnname;
  String enname;
  String playStatus;
  String channel;
  String channelCn;
  String category;
  String area;
  String poster;
  String posterM;

  Resource(
      {this.id,
      this.cnname,
      this.enname,
      this.playStatus,
      this.channel,
      this.channelCn,
      this.category,
      this.area,
      this.poster});

  Resource.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cnname = json['cnname'];
    enname = json['enname'];
    playStatus = json['play_status'];
    channel = json['channel'];
    channelCn = json['channel_cn'];
    category = json['category'];
    area = json['area'];
    poster = json['poster'];
    posterM = json['poster_m'];
  }
}
