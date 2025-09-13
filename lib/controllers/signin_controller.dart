import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../apiRoutes.dart';
import 'auth_controller.dart';

class SigninController extends GetxController {

  final AuthController authController = Get.find<AuthController>();

  final box = GetStorage();

  final passwordVisible = false.obs;

  final email = "".obs;

  final password = "".obs;

  final loading = false.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();



  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }


  void submitFormData() async {
    if (!formKey.currentState!.validate()) {
      Get.snackbar("Error", "Please fix the errors before submitting",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);
      return;
    }


    var requestBody = {
      "email": email.value,
      "password": password.value
    };

    print(requestBody);


    loading.value = true;

    var response = await http.post(
        Uri.parse(ApiRoutes().signInApiRoute),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(requestBody)
    );


    loading.value = false;


    if (response.statusCode == 200) {

      var responseBody = jsonDecode(response.body);

      box.write("token", responseBody["token"]);

      // print(responseBody["token"]);
      //
      // print(responseBody);

      box.write("profileData", jsonEncode(responseBody['data']));

      // authController.loadToken();

      authController.setTokenFromSignInController(responseBody['token'], responseBody['data']);

      Get.offAllNamed("/rootScreen");

      Get.snackbar("Success", "Login Successful",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
    else {
      final decodedBody = jsonDecode(response.body);
      final errorMessage = decodedBody['message'] ?? "Something went wrong";

      Get.snackbar("Failed", errorMessage,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);
    }
  }



}
