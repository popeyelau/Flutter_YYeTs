import 'package:flutter/foundation.dart';
import 'package:yyets/models/resource.dart';

@immutable
class RankState {
  final Ranks ranks;
  final bool isLoading;

  RankState({this.ranks, this.isLoading});

  RankState copyWith({Ranks ranks, bool isLoading}) {
    return RankState(
        ranks: ranks ?? this.ranks, isLoading: isLoading ?? this.isLoading);
  }

  RankState.initialState()
      : ranks = Ranks.initialState(),
        isLoading = true;
}
