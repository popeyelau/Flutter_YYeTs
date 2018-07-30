abstract class ActionType {
  String get type;
  final dynamic payload = "";

  String toString() {
    return '$runtimeType(${payload.toString()})';
  }
}

class VoidAction extends ActionType {
  final String type = "__voidAction__";
}

class ReduxActions {
  // Home Page
  static const String updateTVSchedule = "__updateTVSchedule__";
  static const String updateArticles = "__updateArticles__";
  static const String updateAds = "__updateAds__";
  static const String updateTopRanks = "__updateTopRanks__";
  static const String updateLibResources = "__updateLibResources__";
  static const String updateFiltedResources = "__updateFiltedResources__";
  static const String updateResourceCategory = "__updateResourceCategory__";
  static const String updateHotKeywords = "__updateHotKeywords__";
  static const String updateSearchResults = "__updateSearchResults__";

  static const String updateComments = "__updateComments__";
  static const String updateHelps = "__updateHelps__";
  static const String updateVideoInfo = "__updateVideoInfo__";
  static const String updateVideoComments = "__updateVideoComments__";
  static const String updateUserProfile = "__updateUserProfile__";
  static const String updateArticleComments = "__updateArticleComments__";
}
