import 'dart:ui';
import 'package:apis/const/typography.dart';
import 'package:apis/views/home/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFF000000),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Blurred and enlarged background image
          Positioned.fill(
            child: Image.asset(
              'assets/img/food.png',
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.8), // Adjust opacity as needed
              colorBlendMode:
                  BlendMode.darken, // Add blending mode for darkness
            ),
          ),
          // Blur effect for background image
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 10, sigmaY: 10), // Adjust blur intensity
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          // Centered duplicate image
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width * 0.7,
                  child: Image.asset(
                    'assets/img/food.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20), // Adjust spacing as needed
                Text(
                  'Food Guide',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Find Your Recipe Quick',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 20), // Adjust spacing as needed
                ElevatedButton(
                  onPressed: () {
                    // Handle button tap
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color(0xFFFF6536), // Button background color
                    minimumSize: Size(width * 0.6, 60), // Set width and height
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ),
                      );
                    },
                    child: Text(
                      'Let\'s Start',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: semibold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
