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
                    backgroundImage: AssetImage("assets/images/user_icon.png"),
                  ),

                  // Positioned(
                  //   bottom: 0,
                  //   right: 0,
                  //   child: CircleAvatar(
                  //     radius: 16,
                  //     backgroundColor: Colors.white,
                  //     child: Icon(Icons.edit, size: 18, color: Colors.black),
                  //   ),
                  // ),
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

              // // Notification toggle
              // Material(
              //   color: Colors.grey[850],
              //   borderRadius: BorderRadius.circular(8),
              //   child: InkWell(
              //     splashColor: Colors.white24,
              //     highlightColor: Colors.white10,
              //     borderRadius: BorderRadius.circular(8),
              //     onTap: (){
              //
              //     },
              //     child: Padding(
              //       padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           const Text(
              //             "Notification",
              //             style: TextStyle(color: Colors.white, fontSize: 16),
              //           ),
              //           Transform.scale(
              //             scale: 0.8,
              //             child: Switch(
              //               value: true,
              //               onChanged: (val) {},
              //               activeColor: const Color(0xFF9CFE4F), // green switch
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              //
              // const SizedBox(height: 15),
              //
              // // Settings toggle
              //
              //
              // Material(
              //   color: Colors.grey[850], // background so ripple is visible
              //   borderRadius: BorderRadius.circular(8),
              //   child: InkWell(
              //     onTap: () {
              //       // your action here
              //     },
              //     splashColor: Colors.white24,   // ripple color
              //     highlightColor: Colors.white10, // pressed color
              //     borderRadius: BorderRadius.circular(8),
              //     child: Padding(
              //       padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: const [
              //           Text(
              //             "Settings",
              //             style: TextStyle(color: Colors.white, fontSize: 16),
              //           ),
              //           Icon(Icons.settings, color: Colors.white),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),



              const SizedBox(height: 20,),
              Align(
                alignment: Alignment.topLeft,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      fixedSize: const Size(150, 35),
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.red[300],
                    ),
                    onPressed: () {
                      // LOGOUT HERE
                      Get.offAllNamed('/signinScreen');

                      authController.logout();

                      Get.snackbar(
                          "Success",
                          "Logout successful",
                          backgroundColor: Colors.greenAccent,
                          colorText: Colors.black
                      );

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.logout, color: Colors.white,),
                        const SizedBox(width: 5,),
                        Text(
                          "Logout",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    )
                ),
              )




            ],
          ),
        ),
      ),
    );
  }
}
