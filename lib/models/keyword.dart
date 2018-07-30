class Keyword {
  String keyword;

  Keyword({this.keyword});

  Keyword.fromJson(Map<String, dynamic> json) {
    keyword = json['keyword'];
  }
}