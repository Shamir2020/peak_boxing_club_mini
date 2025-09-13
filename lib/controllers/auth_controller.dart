import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';


class AuthController extends GetxController{

  final token = "".obs;
  final box = GetStorage();
  final loggedinStatus = false.obs;
  final profileData = {}.obs;


  void clearToken(){
    token.value = "";
    loggedinStatus.value = false;
  }

  void setToken(String token){

    box.write("token", token);

  }

  void logout(){
    box.remove("token");
    box.remove("profileData");
    clearToken();
  }


  void loadSubscriptionData(){

    if (profileData.values.isEmpty){
      return;
    }

    print(profileData.values);


  }

  void loadToken(){

    final tokenFromStorage = box.read('token');

    print('Token ${tokenFromStorage}');



    if (tokenFromStorage == null){
      loggedinStatus.value = false;
      token.value = "";
    }
    else {
      // Map<String, dynamic> decodedToken = JwtDecoder.decode(tokenFromStorage);
      //
      // print(decodedToken);



      profileData.value = jsonDecode(box.read('profileData'));

      loggedinStatus.value = true;
      token.value = tokenFromStorage;

    }


  }

  void setTokenFromSignInController(String token1, profileData1){

    // print(token1);
    // print('PROFILE DATA');
    // print(profileData);

    profileData.value = profileData1;

    loggedinStatus.value = true;
    token.value = token1;
  }

  bool isLoggedIn(){
    if (token.value.isNotEmpty){
      return true;
    }

    return false;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    loadToken();
  }

}