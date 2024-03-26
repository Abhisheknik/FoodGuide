import 'package:apis/const/typography.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apis/controller/product_controller.dart';
import 'package:apis/views/meal_details/meal_details.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Card"),
        centerTitle: true,
        backgroundColor: Color(0xFFFF6536),
        elevation: 0,
      ),
      backgroundColor: Color.fromARGB(255, 255, 235, 235),
      body: Consumer<ProductsController>(
        builder: (context, controller, _) {
          return controller.is_loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : controller.meals == null
                  ? Center(
                      child: Text("No Meals Found"),
                    )
                  : ListView.builder(
                      itemCount: controller.meals!.meals!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            controller.fetchMealsDetails(
                                controller.meals!.meals![index].idMeal);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MealDetails(),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5.0,
                                  offset: Offset(0.0, 2.0),
                                ),
                              ],
                            ),
                            child: Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        controller
                                            .meals!.meals![index].strMealThumb
                                            .toString(),
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            controller
                                                .meals!.meals![index].strMeal
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: semibold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(height: 5),

                                          // You can add additional text or widgets here
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
        },
      ),
    );
  }
}
