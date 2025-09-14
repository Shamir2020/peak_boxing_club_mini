import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:peak_boxing_club_mini/apiRoutes.dart';
import 'package:peak_boxing_club_mini/controllers/auth_controller.dart';

class SubscriptionController extends GetxController{
  var subscriptionData = {}.obs;
  var loading = true.obs;
  var isSubscriptionActive = true.obs;
  var isSubscriptiopnExpired = false.obs;
  var isSubscriptionExist = false.obs;

  final AuthController authController = Get.find();

  void loadSubscriptionData() async{

    Map<String, dynamic> decodedToken = JwtDecoder.decode(authController.token.value);

    var userId = decodedToken["_id"];
    print("ID = " + decodedToken["_id"]);

    var response = await http.get(Uri.parse(ApiRoutes().subscriptionGetApiRoute + decodedToken["_id"]));

    if (response.statusCode == 200){
      var responseBody = response.body;

      // print(responseBody);

      var subscription = jsonDecode(responseBody)['data'];

      print("Subscription data = ${subscription}");

      if (subscription == null || subscription == ""){
        isSubscriptionExist.value = false;
      }
      else {
        var data = {};

        if (subscription["subscription"] != null){
          var subData = {};
          subData["serviceName"] = subscription['subscription']['serviceName'];
          subData['price'] = subscription['subscription']['price'];
          subData['description'] = subscription['subscription']['description'];

          data['subscription'] = subData;

          // data['subscription'] = subscription['subscription'];
        }

        data['paymentStatus'] = subscription['paymentStatus'];
        data['startDate'] = subscription['startDate'].split("T")[0];
        data['method'] = subscription['method'];

        // DUMMY END DATE - AFTER 30 DAYS
        var endDate = DateTime.parse(subscription["startDate"]).add(Duration(days: 30));

        data['endDate'] = endDate.toString().split(" ")[0];

        data['daysLeft'] = endDate.difference(DateTime.now()).inDays;


        if (data['daysLeft'] <= 0){
          isSubscriptiopnExpired.value = true;

        }
        else {
          isSubscriptionActive.value = true;
        }

        subscriptionData.value = data;
        isSubscriptionExist.value = true;

      }


      // subscriptionData.value = jsonDecode(responseBody)["data"];

    }
    else if (response.statusCode == 401){
      Get.snackbar(
          "Not found",
          "No subscription found !"
      );
      isSubscriptionExist.value = false;
      isSubscriptionActive.value = false;
    }
    else{
      Get.snackbar(
          "Failed",
          "Subscription data could not be fetched !"
      );
    }

    loading.value = false;

  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    loadSubscriptionData();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();

  }

}