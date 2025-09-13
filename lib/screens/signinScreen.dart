import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/signin_controller.dart';
import '../styles/styles.dart';
// import 'package:peak_boxing_club/styles/style.dart';

class LoginPage extends StatelessWidget {

  final SigninController controller = Get.put(SigninController());

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Obx(() {
          if (controller.loading.value) {
            return const CircularProgressIndicator();
          } else {
            return Container(
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
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: height * 0.15,),
                      CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.transparent,
                        child: Image.asset("assets/images/app_icon_rounded.jpg"),
                      ),
                      const SizedBox(height: 20),

                      Text(
                        "Sign In Page",
                        textAlign: TextAlign.center,
                        style: textHeader1(context),
                      ),
                      const SizedBox(height: 10),

                      const Center(
                        child: Text(
                          "Sign in to manage your subscriptions",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Email Field //
                      TextFormField(
                        controller: controller.emailController,
                        onChanged: (value) => controller.email.value = value,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.black26, // darker like Figma
                          hintText: "Email",
                          hintStyle: const TextStyle(color: Colors.grey),
                          prefixIcon: const Icon(Icons.email, color: Colors.white70),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: FormFieldText1(context),
                        validator: (value){
                          if (value == null || value.trim().isEmpty){
                            return "Email is required";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // Password Field //
                      Obx(() => TextFormField(
                        controller: controller.passwordController,
                        onChanged: (value) => controller.password.value = value,
                        obscureText: !controller.passwordVisible.value,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.black26,
                          hintText: "Password",
                          hintStyle: const TextStyle(color: Colors.grey),
                          prefixIcon: const Icon(Icons.lock, color: Colors.white70),
                          suffixIcon: IconButton(
                            onPressed: controller.togglePasswordVisibility,
                            icon: Icon(
                              controller.passwordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white70,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: FormFieldText1(context),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Password is required";
                          }
                          if (value.length < 6) {
                            return "Password must be at least 6 characters";
                          }
                          return null;
                        },
                      )),

                      const SizedBox(height: 10),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Get.snackbar("Forgot Password", "Redirect to reset password");
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(color: Color(0xFF9CFE4F)), // neon green
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: controller.submitFormData,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF9CFE4F), // Neon Green
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("SIGN IN", style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(width: 10),
                              Icon(Icons.arrow_forward),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Text("Don't have an account? ", style: normalText1(context)),
                      //     GestureDetector(
                      //       onTap: () => Get.offNamed('/signUp'),
                      //       child: const Text(
                      //         "Sign Up",
                      //         style: TextStyle(
                      //           color: Color(0xFF9CFE4F),
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
