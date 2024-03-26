import 'dart:convert';
import 'package:apis/models/get_categories_response.dart';
import 'package:apis/models/get_meal_details_response.dart';
import 'package:apis/models/get_meals_response.dart';
import 'package:apis/models/get_random_response.dart';
import 'package:apis/models/get_search_response.dart';
import 'package:http/http.dart' as http;

class ProductApis {
  Future<GetCategoriesResponse?> getCategoriesApi() async {
    String url = "https://www.themealdb.com/api/json/v1/1/categories.php";

    try {
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        var body = res.body;
        return GetCategoriesResponse.fromJson(jsonDecode(body));
      } else {
        return null;
      }
    } catch (e) {
      // print(e);
      return null;
    }
  }

  Future<GetMealsResponse?> getMealsApi(category) async {
    String url =
        "https://www.themealdb.com/api/json/v1/1/filter.php?c=$category";

    try {
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        var body = res.body;
        return GetMealsResponse.fromJson(jsonDecode(body));
      } else {
        return null;
      }
    } catch (e) {
      // print(e);
      return null;
    }
  }

  Future<GetMealDetailsResponse?> getMealsDetailsApi(mealid) async {
    String url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=$mealid";

    try {
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        var body = res.body;
        return GetMealDetailsResponse.fromJson(jsonDecode(body));
      } else {
        return null;
      }
    } catch (e) {
      // print(e);
      return null;
    }
  }

  Future<GetRandomResponse?> getRandomApi() async {
    String url = "https://www.themealdb.com/api/json/v1/1/random.php";

    try {
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        var body = res.body;
        return GetRandomResponse.fromJson(jsonDecode(body));
      } else {
        return null;
      }
    } catch (e) {
      // print(e);
      return null;
    }
  }

  Future<GetSearchResponse?> getSearchApi(strMeal) async {
    String url =
        "https://www.themealdb.com/api/json/v1/1/search.php?s=$strMeal";
    try {
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        var body = res.body;
        return GetSearchResponse.fromJson(jsonDecode(body));
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
