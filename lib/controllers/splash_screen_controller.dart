import 'package:get/get.dart';

class SplashScreenController extends GetxController{


  void loadApp() async {

    await Future.delayed(Duration(seconds: 1));

    Get.offAllNamed("/rootScreen");

  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    loadApp();

  }


}