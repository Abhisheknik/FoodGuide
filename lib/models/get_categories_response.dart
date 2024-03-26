
class GetCategoriesResponse {
  List<Categories>? categories;

  GetCategoriesResponse({this.categories});

  GetCategoriesResponse.fromJson(Map<String, dynamic> json) {
    categories = json["categories"] == null ? null : (json["categories"] as List).map((e) => Categories.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(categories != null) {
      _data["categories"] = categories?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Categories {
  String? idCategory;
  String? strCategory;
  String? strCategoryThumb;
  String? strCategoryDescription;

  Categories({this.idCategory, this.strCategory, this.strCategoryThumb, this.strCategoryDescription});

  Categories.fromJson(Map<String, dynamic> json) {
    idCategory = json["idCategory"];
    strCategory = json["strCategory"];
    strCategoryThumb = json["strCategoryThumb"];
    strCategoryDescription = json["strCategoryDescription"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["idCategory"] = idCategory;
    _data["strCategory"] = strCategory;
    _data["strCategoryThumb"] = strCategoryThumb;
    _data["strCategoryDescription"] = strCategoryDescription;
    return _data;
  }
}