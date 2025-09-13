import 'package:flutter/material.dart';
import 'package:peak_boxing_club_mini/controllers/subscription_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:get/get.dart';

class QRView extends StatelessWidget {

  final SubscriptionController subscriptionController = Get.put(SubscriptionController());

  QRView({super.key});

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white
                ),
                child: Obx((){
                  if (subscriptionController.loading.value){
                    return CircularProgressIndicator();
                  }
                  else if (!subscriptionController.isSubscriptionExist.value){
                    return QrImageView(
                      data: "No Subscription found for this person",
                      version: QrVersions.auto,
                      size: width * 0.8,
                      gapless: false,
                      backgroundColor: Colors.white,
                    );
                  }
                  else {
                    return QrImageView(
                      data: "Start: ${subscriptionController.subscriptionData["startDate"]}, "
                          "End: ${subscriptionController.subscriptionData["endDate"]}, "
                          "Active Status: ${subscriptionController.isSubscriptionActive}",
                      version: QrVersions.auto,
                      size: width * 0.8,
                      gapless: false,
                      backgroundColor: Colors.white,
                    );
                  }
                })
              ),
            )
          ],
        ),
      ),
    );
  }
}
