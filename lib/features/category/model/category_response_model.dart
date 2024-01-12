class CategoriesResponse {
  List<dynamic>? categories;

  CategoriesResponse({this.categories});

  CategoriesResponse.fromJson(Map<String, dynamic> json) {
    categories = json['categories'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories'] = this.categories;
    return data;
  }
}