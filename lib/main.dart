import 'package:apis/controller/product_controller.dart';
import 'package:apis/views/home/home.dart';
import 'package:apis/views/home/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductsController(),
        ),
      ],
      child: MaterialApp(
        home: SplashScreen(),
        // home: Home(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
