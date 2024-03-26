import 'package:apis/views/meal_details/search_meal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apis/controller/product_controller.dart';
import 'package:apis/views/meal/meal.dart';
import 'package:apis/views/meal_details/meal_details.dart';
import 'package:apis/const/typography.dart';

class Home extends StatefulWidget {
  Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<void> _fetchDataFuture;
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _fetchDataFuture = _fetchData();
  }

  Future<void> _fetchData() async {
    var controller = Provider.of<ProductsController>(context, listen: false);
    await controller.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    ProductsController controller =
        Provider.of<ProductsController>(context, listen: false);
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
                onSubmitted: (value) async {
                  print(searchController.text);
                  await controller.fetchSearch(searchController.text);
                  controller
                      .fetchMealsDetails(controller.meals!.meals![0].strMeal);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchMeals(),
                    ),
                  );
                },
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white),
                ),
                style: TextStyle(color: Colors.white),
              )
            : Text(
                "Food Guide",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
              });
            },
            icon: Icon(
              _isSearching ? Icons.close : Icons.search,
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: Color(0xFFFF6536),
        elevation: 0,
      ),
      backgroundColor: Color(0xD2FCCCBE),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: FutureBuilder<void>(
          future: _fetchDataFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Error fetching data",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              );
            } else {
              return Consumer<ProductsController>(
                builder: (context, controller, _) {
                  return controller.categories == null
                      ? Center(
                          child: Text(
                            "No Categories Found",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 6.0,
                            crossAxisSpacing: 6.0,
                            childAspectRatio: 0.9,
                          ),
                          itemCount: controller.categories!.categories!.length,
                          itemBuilder: (context, index) {
                            // Inside the GridView.builder itemBuilder method
                            return Padding(
                              padding: EdgeInsets.only(
                                  top: 10,
                                  right: 10,
                                  left: 10,
                                  bottom: 10), // Adjust padding as needed
                              child: GestureDetector(
                                onTap: () {
                                  controller.fetchMeals(controller.categories!
                                      .categories![index].strCategory);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MealsScreen(),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 3.0,
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
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Hero(
                                            tag: controller
                                                .categories!
                                                .categories![index]
                                                .strCategoryThumb
                                                .toString(),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.network(
                                                controller
                                                    .categories!
                                                    .categories![index]
                                                    .strCategoryThumb
                                                    .toString(),
                                                width: width * 0.9,
                                                height: 100,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            controller.categories!
                                                .categories![index].strCategory
                                                .toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              fontFamily: semibold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          // Center(
                                          //   child: Text(
                                          //     controller
                                          //                 .categories!
                                          //                 .categories![index]
                                          //                 .strCategoryDescription
                                          //                 .toString()
                                          //                 .length >
                                          //             50
                                          //         ? controller
                                          //             .categories!
                                          //             .categories![index]
                                          //             .strCategoryDescription
                                          //             .toString()
                                          //             .substring(0,
                                          //                 55) // Limiting to the first 50 characters
                                          //         : controller
                                          //             .categories!
                                          //             .categories![index]
                                          //             .strCategoryDescription
                                          //             .toString(),
                                          //     textAlign: TextAlign
                                          //         .center, // Center align the text
                                          //     style: TextStyle(
                                          //       fontSize: 9,
                                          //       fontFamily: regular,
                                          //       color: Colors.black,
                                          //     ),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async {
              await controller.fetchRandom();
              print(controller.random);
              var mealId = controller.random!.meals![0].idMeal;

              await controller.fetchMealsDetails(mealId);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MealDetails(),
                ),
              );
            },
            child: Icon(Icons.fastfood),
            backgroundColor: Color(0xFFFF6536),
          ),
          SizedBox(
            width: 16,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
