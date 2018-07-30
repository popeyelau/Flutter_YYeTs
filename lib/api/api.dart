import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:yyets/models/article_comment.dart';
import 'package:yyets/models/comment.dart';
import 'package:yyets/models/help.dart';
import 'package:yyets/models/keyword.dart';
import 'package:yyets/models/lib_resource.dart';
import 'package:yyets/models/ad.dart';
import 'package:yyets/models/article.dart';
import 'package:yyets/models/profile.dart';
import 'package:yyets/models/resource.dart';
import 'package:yyets/models/resource_category.dart';
import 'package:yyets/models/tv_schedule.dart';
import 'package:yyets/models/video_comment.dart';
import 'package:yyets/models/video_info.dart';
import 'package:yyets/redux/actions/dynamic.dart';
import 'package:yyets/redux/actions/home.dart';
import 'package:yyets/redux/actions/lib.dart';
import 'package:yyets/redux/actions/profile.dart';
import 'package:yyets/redux/actions/rank.dart';
import 'package:yyets/redux/actions/search.dart';
import 'package:yyets/redux/view_models/main.dart';
import 'package:intl/intl.dart';

class Networking {
  static fetchtSchedule() async {
    final today = DateTime.now();
    final formatter = DateFormat("yyyy-MM-dd");
    final start = formatter.format(today);
    final end = formatter.format(today.add(Duration(days: 1)));

    final url =
        "http://ios.zmzapi.com/index.php?accesskey=519f9cab85c8059d17544947k361a827&client=1&g=api/v3&m=index&a=tv_schedule&end=$end&start=$start";
    var response = await http.get(url);
    Map<String, dynamic> map = JSON.decode(response.body)["data"];
    List<TVSchedule> list = [];
    map.keys.forEach((key) {
      list.addAll(
          (map[key] as List).map((v) => TVSchedule.fromJson(v)).toList());
    });
    StoreContainer.global.dispatch(UpdateTVSchedule(payload: list));
  }

  static fetchArticles() async {
    final url =
        "http://ios.zmzapi.com/index.php?accesskey=519f9cab85c8059d17544947k361a827&client=1&g=api/v3&m=index&a=article_list&page=0&token=edc3c80aed456c1266237e555b5bf218&uid=5704761";
    var response = await http.get(url);
    List map = JSON.decode(response.body)["data"];
    List<Article> list = [];
    list = map.map((v) => Article.fromJson(v)).toList();
    StoreContainer.global.dispatch(UpdateArticles(payload: list));
  }

  static fetchBanners() async {
    final url = "http://ctrl.zmzapi.net/app/ads?platform=7&ver=252";
    var response = await http.get(url);
    List map = JSON.decode(response.body)["ads"];
    List<Ad> list = [];
    list = map.map((v) => Ad.fromJson(v)).toList();
    StoreContainer.global.dispatch(UpdateAds(payload: list));
  }

  static fetchTopRanks() async {
    final url =
        "http://ios.zmzapi.com/index.php?accesskey=519f9cab85c8059d17544947k361a827&client=1&g=api/v3&m=index&a=hot&limit=30";
    var response = await http.get(url);
    Map<String, dynamic> map = JSON.decode(response.body)["data"];
    Ranks ranks = Ranks.fromJson(map);

    StoreContainer.global.dispatch(UpdateTopRanks(payload: ranks));
  }

  static fetchLibResources(
      {String category = "",
      String tv = "",
      String year = "",
      String channel = "",
      String area = "",
      String sort = "itemupdate"}) async {
    final url =
        "http://ios.zmzapi.com/index.php?accesskey=519f9cab85c8059d17544947k361a827&client=1&g=api/v3&m=index&a=resource_storage&area=$area&category=$category&channel=$channel&order=$sort&page=1&tv=$tv&year=$year";
    var response = await http.get(url);
    List map = JSON.decode(response.body)["data"];
    List<LibResource> list = [];
    list = map.map((v) => LibResource.fromJson(v)).toList();
    StoreContainer.global.dispatch(UpdateFiltedResources(payload: list));
  }

  static fetchLibIndexResources({String sort = "itemupdate"}) async {
    final url =
        "http://ios.zmzapi.com/index.php?accesskey=519f9cab85c8059d17544947k361a827&client=1&g=api/v3&m=index&a=resource_storage&area=&order=$sort&page=1";
    var response = await http.get(url);
    List map = JSON.decode(response.body)["data"];
    List<LibResource> list = [];
    list = map.map((v) => LibResource.fromJson(v)).toList();

    StoreContainer.global.dispatch(UpdateLibResources(payload: list));
  }

  static fetchResourceCategory() async {
    final url =
        "http://ios.zmzapi.com/index.php?accesskey=519f9cab85c8059d17544947k361a827&client=1&g=api/v3&m=index&a=resource_category";
    var response = await http.get(url);
    Map<String, dynamic> map = JSON.decode(response.body)["data"];
    final category = ResourceCategory.fromJson(map);
    StoreContainer.global.dispatch(UpdateResourceCategory(payload: category));
  }

  static fetchHotSearchKeywords() async {
    final url =
        "http://ios.zmzapi.com/index.php?accesskey=519f9cab85c8059d17544947k361a827&client=1&g=api/v3&m=index&a=hot_keywords";
    var response = await http.get(url);
    List map = JSON.decode(response.body)["data"];
    List<Keyword> keywords = map.map((v) => Keyword.fromJson(v)).toList();
    StoreContainer.global.dispatch(UpdateHotKeywords(payload: keywords));
  }

  static searchResrouces({String keyword}) async {
    final url =
        "http://ios.zmzapi.com/index.php?accesskey=519f9cab85c8059d17544947k361a827&client=1&g=api/v3&m=index&a=search&k=$keyword&limit=20&page=1&st=resource";
    var response = await http.get(url);
    List map = JSON.decode(response.body)["data"]["resource"];
    List<LibResource> results =
        map.map((v) => LibResource.fromJson(v)).toList();
    StoreContainer.global.dispatch(UpdateSearchResults(payload: results));
  }

  static fetchHotComments() async {
    final url =
        "http://ios.zmzapi.com/index.php?accesskey=519f9cab85c8059d17544947k361a827&client=1&g=api/v3&m=index&a=hot_comments_list&limit=15&page=1";
    var response = await http.get(url);
    List map = JSON.decode(response.body)["data"];
    List<Comment> comments = map.map((v) => Comment.fromJson(v)).toList();
    StoreContainer.global.dispatch(UpdateComments(payload: comments));
  }

  static fetchHotHelps() async {
    final url =
        "http://ios.zmzapi.com/index.php?accesskey=519f9cab85c8059d17544947k361a827&client=1&g=api/v3&m=index&a=help_list&limit=15&page=1";
    var response = await http.get(url);
    List map = JSON.decode(response.body)["data"];
    List<Help> comments = map.map((v) => Help.fromJson(v)).toList();
    StoreContainer.global.dispatch(UpdateHelps(payload: comments));
  }

  static Future<VideoInfo> fetchVideoInfo({String id}) async {
    final url =
        "http://ios.zmzapi.com/index.php?accesskey=519f9cab85c8059d17544947k361a827&client=1&g=api/v3&m=index&a=resource&id=$id";
    var response = await http.get(url);
    Map<String, dynamic> map = JSON.decode(response.body)["data"];
    VideoInfo info = VideoInfo.fromJson(map);
    return info;
  }

  static Future<List<VideoComment>> fetchVideoComments(
      {String videoId = "36384"}) async {
    final url =
        "http://ios.zmzapi.com/index.php?accesskey=519f9cab85c8059d17544947k361a827&client=1&g=api/v3&m=index&a=comments_list&channel=tv&itemid=$videoId&limit=10&page=1";
    var response = await http.get(url);
    List map = JSON.decode(response.body)["data"];
    List<VideoComment> comments =
        map.map((v) => VideoComment.fromJson(v)).toList();
    return comments;
  }

  static fetchUserProfile() async {
    final url =
        "http://ios.zmzapi.com/index.php?accesskey=519f9cab85c8059d17544947k361a827&client=1&g=api/v3&m=index&a=login&account=popeyelau%40gmail.com&did=2A2B9DE8-5038-4FBE-8ECB-DD86D3301FB1&password=Yyets123456&registration_id=141fe1da9efde137552";
    var response = await http.get(url);
    Map<String, dynamic> map = JSON.decode(response.body)["data"];
    Profile profile = Profile.fromJson(map);
    StoreContainer.global.dispatch(UpdateUserProfile(payload: profile));
  }

  static Future<List<ArticleComment>> fetchArticleComments(
      {String id = "31138", String channel = "article"}) async {
    final url =
        "http://ios.zmzapi.com/index.php?accesskey=519f9cab85c8059d17544947k361a827&client=1&g=api/v3&m=index&a=comments_list&channel=$channel&itemid=$id&limit=10&page=1";
    var response = await http.get(url);
    Map<String, dynamic> resp = JSON.decode(response.body);
    if (resp["status"] != 1) {
      throw Exception(resp["info"] ?? "获取失败!");
    }
    List data = resp["data"];
    List<ArticleComment> list =
        data.map((v) => ArticleComment.fromJson(v)).toList();
    return list;
  }

  static Future<List<ArticleReply>> fetchReplyList(
      {String id = "348689"}) async {
    final url =
        "http://ios.zmzapi.com/index.php?accesskey=519f9cab85c8059d17544947k361a827&client=1&g=api/v3&m=index&a=reply_list&id=$id&limit=15&page=1";
    var response = await http.get(url);
    List map = JSON.decode(response.body)["data"];
    List<ArticleReply> replys =
        map.map((v) => ArticleReply.fromJson(v)).toList();
    return replys;
  }
}
