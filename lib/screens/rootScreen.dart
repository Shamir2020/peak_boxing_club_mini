import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import 'package:peak_boxing_club_mini/controllers/auth_controller.dart';
import 'package:peak_boxing_club_mini/controllers/rootScreenNav_controller.dart';

class RootScreen extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  final RootScreenNavController rootScreenNavController =
  Get.put(RootScreenNavController());

  RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Obx(() {
      if (authController.loggedinStatus.value) {
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
            child: Obx(
                  () => rootScreenNavController
                  .views[rootScreenNavController.currentViewIndex.value],
            ),
          ),
          bottomNavigationBar: Obx(
                () => Container(
              width: width * 0.8,
              margin: const EdgeInsets.all(20),
              child: GNav(
                selectedIndex:
                rootScreenNavController.currentViewIndex.value,
                onTabChange: (index) {
                  rootScreenNavController.currentViewIndex.value = index;
                },
                rippleColor: const Color.fromRGBO(66, 66, 66, 1),
                hoverColor: const Color.fromRGBO(97, 97, 97, 1.0),
                haptic: true,
                tabBorderRadius: 5,
                tabActiveBorder:
                Border.all(color: Colors.black, width: 1),
                tabShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0), blurRadius: 8)
                ],
                curve: Curves.easeOutExpo,
                duration: const Duration(milliseconds: 300),
                gap: 2,
                color: Colors.grey[100],
                activeColor: Colors.black,
                iconSize: 30,
                tabBackgroundColor:
                const Color.fromRGBO(156, 254, 79, 1),
                padding: const EdgeInsets.symmetric(
                    horizontal: 25, vertical: 5),
                tabs: const [
                  GButton(
                    icon: LineIcons.dollarSign,
                    text: 'Subscriptions',
                  ),
                  GButton(
                    icon: LineIcons.qrcode,
                    text: "QR",
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.offNamed("/signinScreen");
        });
        return const SizedBox.shrink();
      }
    });
  }
}
