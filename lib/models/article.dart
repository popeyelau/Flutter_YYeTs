import 'package:yyets/common/utils.dart';
import 'package:yyets/models/video_info.dart';

class Article {
  String id;
  String mid;
  String typeCn;
  String video480;
  String time;
  String url;
  String type;
  String homepage;
  String video720;
  String oid;
  String good;
  String cover;
  String username;
  String userLogo;
  int goodStatus;
  String nodeType;
  String commentsCount;
  List<Imgs> imgs;
  String content;
  String intro;
  String poster;
  String posterB;
  String posterM;
  String posterS;
  String userpic;
  String groupName;
  String authorName;
  String title;
  String dateline;

  Article(
      {this.id,
      this.mid,
      this.typeCn,
      this.video480,
      this.time,
      this.url,
      this.type,
      this.homepage,
      this.video720,
      this.oid,
      this.good,
      this.cover,
      this.username,
      this.userLogo,
      this.goodStatus,
      this.nodeType,
      this.commentsCount,
      this.imgs,
      this.content,
      this.intro,
      this.poster,
      this.posterB,
      this.posterM,
      this.posterS,
      this.userpic,
      this.groupName,
      this.authorName,
      this.title,
      this.dateline});

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mid = json['mid'];
    typeCn = json['type_cn'];
    video480 = json['video_480'];
    time = json['time'];
    url = json['url'];
    type = json['type'];
    homepage = json['homepage'];
    video720 = json['video_720'];
    oid = json['oid'];
    good = json['good'];
    cover = json['cover'];
    username = json['username'];
    userLogo = json['user_logo'];
    goodStatus = json['good_status'];
    nodeType = json['node_type'];
    commentsCount = json['comments_count'];
    if (json['imgs'] != null) {
      imgs = new List<Imgs>();
      json['imgs'].forEach((v) {
        imgs.add(new Imgs.fromJson(v));
      });
    }
    content = json['content'];
    intro = json['intro'];
    poster = json['poster'];
    posterB = json['poster_b'];
    posterM = json['poster_m'];
    posterS = json['poster_s'];
    userpic = json['userpic'];
    groupName = json['group_name'];
    authorName = json["author_name"];
    title = json["title"];
    dateline = json["dateline"];
  }
}

class ArticleViewModel {
  String id;
  String author;
  String goodCount;
  String commentsCount;
  String content;
  String title;
  String avatar;
  List<String> images;
  String video;
  String videoCover;
  String tag;
  bool liked;
  String time;
  String cid;

  ArticleViewModel.fromArticle(Article article) {
    id = article.id;
    author = article.username ?? article.authorName;
    goodCount = article.good;
    commentsCount = article.commentsCount;
    content = article.content ?? article.intro;
    title = article.title ?? "";
    avatar = article.userLogo ?? article.userpic;
    video = article.video720 ?? "";
    videoCover = article.cover ?? "";
    tag = article.typeCn ?? "";
    liked = article.goodStatus == 1;
    if (article.dateline != null) {
      time = Utils.readTimestamp(int.parse(article.dateline));
    } else {
      time = Utils.readTimestamp(int.parse(article.time));
    }
    cid = article.mid;

    if (isVideo) {
      images = [];
    } else if (article.type == "news" ||
        article.type == "t_review" ||
        article.type == "m_review" ||
        article.type == "new_review" ||
        article.type == "recom") {
      images = [article.posterB];
    } else {
      images = article.imgs.map((i) => i.url).toList() ?? [];
    }
  }

  ArticleViewModel.fromVideoArticle(ArticleList article) {
    id = article.id;
    author = article.authorName;
    goodCount = article.good;
    commentsCount = article.commentsCount;
    content = article.intro;
    title = article.title ?? "";
    avatar = article.userpic;
    video = "";
    videoCover = "";
    tag = article.typeCn ?? "";
    liked = article.goodStatus == 1;
    images = [];

    time = article.dateline ?? "";
    if (article.poster.isNotEmpty) {
      images = [article.poster];
    }
  }

  bool get isVideo {
    return video.isNotEmpty;
  }
}

class Imgs {
  String bigImgUrl;
  int height;
  String url;
  int width;

  Imgs({this.bigImgUrl, this.height, this.url, this.width});

  Imgs.fromJson(Map<String, dynamic> json) {
    bigImgUrl = json['bigImgUrl'];
    height = json['height'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bigImgUrl'] = this.bigImgUrl;
    data['height'] = this.height;
    data['url'] = this.url;
    data['width'] = this.width;
    return data;
  }
}
