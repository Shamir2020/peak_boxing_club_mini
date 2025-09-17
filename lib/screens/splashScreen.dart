import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:peak_boxing_club_mini/controllers/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {

  SplashScreenController spController = Get.put(SplashScreenController());

  SplashScreen({super.key});

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/app_icon_bg_transparent.jpg", width: MediaQuery.of(context).size.width * 0.8,),

              const SizedBox(height: 40,),
              Text("Peak Boxing Club",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),

              const SizedBox(height: 50,),
              Center(
                child: CircularProgressIndicator(),
            )

          ],
        ),
      ),
    );
  }
}
