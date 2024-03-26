import 'package:apis/models/get_categories_response.dart';
import 'package:apis/models/get_meal_details_response.dart';
import 'package:apis/models/get_meals_response.dart';
import 'package:apis/models/get_random_response.dart';
import 'package:apis/models/get_search_response.dart';
import 'package:apis/requests/product_apis.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProductsController extends ChangeNotifier {
  GetCategoriesResponse? categories;
  GetMealsResponse? meals;
  GetMealDetailsResponse? mealsDetails;
  GetRandomResponse? random;
  GetSearchResponse? search;

  ProductApis apis = ProductApis();

  bool is_loading = false;

  set loading(bool value) {
    is_loading = value;
    notifyListeners();
  }

  fetchCategories() async {
    loading = true;
    categories = await apis.getCategoriesApi();
    notifyListeners();
    loading = false;
  }

  fetchMeals(categories) async {
    loading = true;
    meals = await apis.getMealsApi(categories);
    notifyListeners();
    loading = false;
  }

  fetchMealsDetails(mealId) async {
    loading = true;
    mealsDetails = await apis.getMealsDetailsApi(mealId);
    notifyListeners();
    loading = false;
  }

  fetchRandom() async {
    loading = true;
    random = await apis.getRandomApi();
    notifyListeners();
    loading = false;
  }

  fetchSearch(strMeal) async {
    loading = true;
    search = await apis.getSearchApi(strMeal);
    notifyListeners();
    loading = false;
  }
}
