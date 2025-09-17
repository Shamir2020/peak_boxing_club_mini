import 'package:flutter/material.dart';



class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF000000), // Black
              Color(0xFF0C1F0F), // Dark green/black shade
            ],
          ),
        ),
        child: Column(
          children: [
            Center(
              child: Text("No Internet. Please turn on wifi or mobile data."),
            )
          ],
        ),
      ),
    );
  }
}
