import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:peak_boxing_club_mini/controllers/connectivity_check_controller.dart';
import 'package:peak_boxing_club_mini/controllers/subscription_controller.dart';
import 'package:peak_boxing_club_mini/screens/noInternet.dart';
import 'package:peak_boxing_club_mini/screens/rootScreen.dart';
import 'package:peak_boxing_club_mini/screens/signinScreen.dart';
import 'package:peak_boxing_club_mini/screens/splashScreen.dart';
import 'package:peak_boxing_club_mini/theme/app_colors.dart';
import 'controllers/auth_controller.dart';
import 'package:flutter/services.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  Get.put(AuthController());

  Get.put(SubscriptionController());

  Get.put(ConnectivityCheckController());

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  runApp(PeakBoxingClub());
}


class PeakBoxingClub extends StatelessWidget {

  PeakBoxingClub({super.key});

  @override
  Widget build(BuildContext context) {


    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.darkBackground2,
        primaryColor: AppColors.darkBackground,
        textTheme: TextTheme(
            titleLarge: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.darkTitle,
            ),
            titleMedium: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.darkSubtitle,
            ),
            bodyMedium: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.darkSubtitle
            )
        ),
      ),
      initialRoute: '/splashScreen',
      getPages: [
        GetPage(name: '/rootScreen', page: ()=> RootScreen()),
        GetPage(name: '/signinScreen', page: ()=> LoginPage()),
        GetPage(name: '/splashScreen', page: ()=> SplashScreen()),
        GetPage(name: '/noInternet', page: ()=> NoInternetScreen())
      ],
    );
  }
}



