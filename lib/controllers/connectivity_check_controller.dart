import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConnectivityCheckController extends GetxController {
  var isConnected = true.obs;

  Future<void> checkConnection() async {
    bool connected = false;

    try {
      final response = await http
          .get(Uri.parse("https://www.google.com"))
          .timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        connected = true;
      }
    } catch (_) {
      connected = false;
    }

    // Only update if status actually changed
    if (connected != isConnected.value) {
      isConnected.value = connected;
    }
  }

  @override
  void onInit() {
    super.onInit();

    // Initial check
    checkConnection();

    // React to connection status changes
    ever<bool>(isConnected, (connected) {
      if (!connected) {
        Get.snackbar(
          "Oops! No internet",
          "Please check your internet connection",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          duration: const Duration(days: 1), // stays until closed
        );
      } else {
        if (Get.isSnackbarOpen) {
          Get.closeCurrentSnackbar();
        }
        Get.snackbar(
          "Success",
          "Back online!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
      }
    });

    // Periodic re-check every 10 seconds
    ever(isConnected, (_) => print("Internet status: ${isConnected.value}"));
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 6));
      await checkConnection();
      return true;
    });
  }
}
