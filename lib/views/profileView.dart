import 'package:flutter/material.dart';
import 'package:peak_boxing_club_mini/controllers/auth_controller.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {

  final AuthController authController = Get.find();
  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // background gradient later
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Profile picture + edit icon
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      "https://i.pravatar.cc/300",
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.edit, size: 18, color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              // Name
              Text(
                authController.profileData['fullName']!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              // Email
              Text(
                authController.profileData['email']!,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 30),

              // Notification toggle
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Notification",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Switch(
                    value: true,
                    onChanged: (val) {},
                    activeColor: const Color(0xFF9CFE4F), // green switch
                  ),
                ],
              ),

              const SizedBox(height: 15),

              // Settings toggle
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Settings",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Switch(
                    value: false,
                    onChanged: (val) {},
                    activeColor: const Color(0xFF9CFE4F),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
