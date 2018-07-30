class ResourceCategory {
  List<String> category;
  List<String> year;
  List<String> tv;

  ResourceCategory({this.category, this.year, this.tv});

  ResourceCategory.initialState() {
    category = [];
    year = [];
    tv = [];
  }

  ResourceCategory.fromJson(Map<String, dynamic> json) {
    category = (json['category'] as List).map((i) => i.toString()).toList();
    year = (json['year'] as List).map((i) => i.toString()).toList();
    tv = (json['tv'] as List).map((i) => i.toString()).toList();
  }
}
