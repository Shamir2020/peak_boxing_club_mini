import 'package:get/get.dart';
import 'package:peak_boxing_club_mini/views/profileView.dart';
import 'package:peak_boxing_club_mini/views/qrView.dart';
import 'package:peak_boxing_club_mini/views/subscriptionView.dart';
import 'auth_controller.dart';

class RootScreenNavController extends GetxController{

  final AuthController authController = Get.find();

  final currentViewIndex = 0.obs;

  final views = [
    SubscriptionVew(),
    QRView(),
    ProfileView()
    // ContactView(),
    // SettingsView()
  ];

  final viewsNavHeader = [
    "Peak Boxing Club",
    "Login now",
    "Contact",
    "Settings"
  ].obs;

  void NavigateToViews(int index){
    if (index == 1){
      if (authController.isLoggedIn()){
        currentViewIndex.value = index;
        viewsNavHeader.value[1] = "Profile";
      }
      else {
        Get.toNamed('/signIn');
      }
    }
    else {
      currentViewIndex.value = index;
    }
  }

}