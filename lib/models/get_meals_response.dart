
class GetMealsResponse {
  List<Meals>? meals;

  GetMealsResponse({this.meals});

  GetMealsResponse.fromJson(Map<String, dynamic> json) {
    meals = json["meals"] == null ? null : (json["meals"] as List).map((e) => Meals.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(meals != null) {
      _data["meals"] = meals?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Meals {
  String? strMeal;
  String? strMealThumb;
  String? idMeal;

  Meals({this.strMeal, this.strMealThumb, this.idMeal});

  Meals.fromJson(Map<String, dynamic> json) {
    strMeal = json["strMeal"];
    strMealThumb = json["strMealThumb"];
    idMeal = json["idMeal"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["strMeal"] = strMeal;
    _data["strMealThumb"] = strMealThumb;
    _data["idMeal"] = idMeal;
    return _data;
  }
}