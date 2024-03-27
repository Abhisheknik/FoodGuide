import 'package:apis/const/typography.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apis/controller/product_controller.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Food Guide",
          style: TextStyle(fontFamily: semibold),
        ),
        backgroundColor: Color(0xFFFF6536),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 255, 235, 235),
      body: Consumer<ProductsController>(
        builder: (context, controller, _) {
          return controller.is_loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : controller.mealsDetails == null
                  ? Center(
                      child: Text("No Meals Found"),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Card(
                            elevation: 4,
                            margin: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4),
                                    topRight: Radius.circular(4),
                                  ),
                                  child: Image.network(
                                    controller
                                        .mealsDetails!.meals![0].strMealThumb
                                        .toString(),
                                    fit: BoxFit.cover,
                                    height: 200,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller
                                            .mealsDetails!.meals![0].strMeal
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Area: ${controller.mealsDetails!.meals![0].strArea}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      SizedBox(height: 16),
                                      Text(
                                        "Instructions:",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        controller.mealsDetails!.meals![0]
                                            .strInstructions
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
        },
      ),
    );
  }
}
