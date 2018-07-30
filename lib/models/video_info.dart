import 'package:yyets/models/help.dart';
import 'package:yyets/models/resource.dart';

class VideoInfo {
  List<Resource> similarList;
  List<ArticleList> articleList;
  List<Help> helpList;
  List<SeasonList> seasonList;
  ResourceInfo resourceInfo;

  VideoInfo(
      {this.similarList,
      this.articleList,
      this.helpList,
      this.seasonList,
      this.resourceInfo});

  VideoInfo.initialState() {
    similarList = [];
    articleList = [];
    helpList = [];
    seasonList = [];
    resourceInfo = ResourceInfo.initialState();
  }

  VideoInfo.fromJson(Map<String, dynamic> json) {
    if (json['similar_list'] != null) {
      similarList = new List<Resource>();
      json['similar_list'].forEach((v) {
        similarList.add(new Resource.fromJson(v));
      });
    }
    if (json['article_list'] != null) {
      articleList = new List<ArticleList>();
      json['article_list'].forEach((v) {
        articleList.add(new ArticleList.fromJson(v));
      });
    }
    if (json['help_list'] != null) {
      helpList = new List<Help>();
      json['help_list'].forEach((v) {
        helpList.add(new Help.fromJson(v));
      });
    }
    if (json['season_list'] != null) {
      seasonList = new List<SeasonList>();
      json['season_list'].forEach((v) {
        seasonList.add(new SeasonList.fromJson(v));
      });
    }
    resourceInfo = json['resource_info'] != null
        ? new ResourceInfo.fromJson(json['resource_info'])
        : null;
  }
}

class ArticleList {
  String id;
  String intro;
  String commentsCount;
  String typeCn;
  String author;
  String userpic;
  String type;
  String title;
  String good;
  String dateline;
  String groupName;
  int goodStatus;
  String poster;
  String authorName;
  String posterB;
  String posterM;
  String posterS;
  String views;

  ArticleList(
      {this.id,
      this.intro,
      this.commentsCount,
      this.typeCn,
      this.author,
      this.userpic,
      this.type,
      this.title,
      this.good,
      this.dateline,
      this.groupName,
      this.goodStatus,
      this.poster,
      this.authorName,
      this.posterB,
      this.posterM,
      this.posterS,
      this.views});

  ArticleList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    intro = json['intro'];
    commentsCount = json['comments_count'].toString();
    typeCn = json['type_cn'];
    author = json['author'];
    userpic = json['userpic'];
    type = json['type'];
    title = json['title'];
    good = json['good'];
    dateline = json['dateline'];
    groupName = json['group_name'];
    goodStatus = json['good_status'];
    poster = json['poster'];
    authorName = json['author_name'];
    posterB = json['poster_b'];
    posterM = json['poster_m'];
    posterS = json['poster_s'];
    views = json['views'];
  }
}

class SeasonList {
  String season;
  String seasonCn;
  List<EpisodeList> episodeList;

  SeasonList({this.season, this.seasonCn, this.episodeList});

  SeasonList.fromJson(Map<String, dynamic> json) {
    season = json['season'];
    seasonCn = json['season_cn'];
    if (json['episode_list'] != null) {
      episodeList = new List<EpisodeList>();
      json['episode_list'].forEach((v) {
        episodeList.add(new EpisodeList.fromJson(v));
      });
    }
  }
}

class EpisodeList {
  int playStatus;
  String playTime;
  String playStatusCn;
  String episode;

  EpisodeList(
      {this.playStatus, this.playTime, this.playStatusCn, this.episode});

  EpisodeList.fromJson(Map<String, dynamic> json) {
    playStatus = json['play_status'];
    playTime = json['play_time'];
    playStatusCn = json['play_status_cn'];
    episode = json['episode'];
  }
}

class ResourceInfo {
  String rank;
  String cnname;
  String lang;
  String playStatus;
  String favorites;
  String aliasname;
  String channel;
  String score;
  String views;
  String category;
  String posterS;
  String id;
  String enname;
  String format;
  String poster;
  String itemupdate;
  String premiere;
  String area;
  String scoreCounts;
  int favoriteStatus;
  String tvstation;
  String posterM;
  String posterB;
  String content;

  ResourceInfo(
      {this.rank,
      this.cnname,
      this.lang,
      this.playStatus,
      this.favorites,
      this.aliasname,
      this.channel,
      this.score,
      this.views,
      this.category,
      this.posterS,
      this.id,
      this.enname,
      this.format,
      this.poster,
      this.itemupdate,
      this.premiere,
      this.area,
      this.scoreCounts,
      this.favoriteStatus,
      this.tvstation,
      this.posterM,
      this.posterB,
      this.content});

  ResourceInfo.initialState() {
    cnname = "";
    channel = "tv";
    posterM = "";
    poster = "";
  }

  ResourceInfo.fromJson(Map<String, dynamic> json) {
    rank = json['rank'];
    cnname = json['cnname'];
    lang = json['lang'];
    playStatus = json['play_status'];
    favorites = json['favorites'];
    aliasname = json['aliasname'];
    channel = json['channel'];
    score = json['score'];
    views = json['views'];
    category = json['category'];
    posterS = json['poster_s'];
    id = json['id'];
    enname = json['enname'];
    format = json['format'];
    poster = json['poster'];
    itemupdate = json['itemupdate'];
    premiere = json['premiere'];
    area = json['area'];
    scoreCounts = json['score_counts'];
    favoriteStatus = json['favorite_status'];
    tvstation = json['tvstation'];
    posterM = json['poster_m'];
    posterB = json['poster_b'];
    content = json['content'];
  }
}
