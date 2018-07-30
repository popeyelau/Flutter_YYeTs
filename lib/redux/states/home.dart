import 'package:flutter/foundation.dart';
import 'package:yyets/models/ad.dart';
import 'package:yyets/models/article.dart';
import 'package:yyets/models/tv_schedule.dart';

@immutable
class HomeState {
  final List<TVSchedule> schedules;
  final List<Article> articles;
  final List<Ad> ads;
  final bool isLoading;

  HomeState({this.schedules, this.articles, this.ads, this.isLoading});

  HomeState copyWith(
      {List<TVSchedule> schedules,
      List<Article> articles,
      List<Ad> ads,
      bool isLoading}) {
    return HomeState(
        schedules: schedules ?? this.schedules,
        articles: articles ?? this.articles,
        ads: ads ?? this.ads,
        isLoading: isLoading ?? this.isLoading);
  }

  HomeState.initialState()
      : schedules = [],
        articles = [],
        ads = [],
        isLoading = true;
}
