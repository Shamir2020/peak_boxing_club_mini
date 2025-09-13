import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peak_boxing_club_mini/controllers/subscription_controller.dart';
import '../controllers/auth_controller.dart';
import '../controllers/rootScreenNav_controller.dart';
import '../styles/styles.dart';

class SubscriptionVew extends StatelessWidget {
  final AuthController authController = Get.find();

  final SubscriptionController subscriptionController = Get.put(SubscriptionController());

  SubscriptionVew({super.key});

  @override
  Widget build(BuildContext context) {
    RootScreenNavController rootNavController = Get.put(RootScreenNavController());

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'WELCOME BACK',
              style: TextStyle(fontSize: 13, color: Colors.white70, letterSpacing: 1),
            ),
            Text(
              authController.profileData["fullName"],
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.grey[700],
              foregroundColor: const Color(0xFF9CFE4F),
            ),
            onPressed: () {
              // Get.back();
              // rootNavController.currentViewIndex.value = 1;
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF000000),
              Color(0xFF0C1F0F),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Header
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "Your Subscription Details",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),

            // Subscription Card
            Obx((){
              if (subscriptionController.loading.value){
               return Center(child: CircularProgressIndicator(),);
              }
              else if (!subscriptionController.isSubscriptionExist.value){
                return Center(
                  child: Text("Contact the gym owner to buy a subscription"),
                );
              }
              else {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color(0xFF232627),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Colors.black54,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.workspace_premium, color: Colors.amber, size: 28),
                        ),
                        title: const Text("Pro Ringside",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                        subtitle: const Text(
                          "Full Access to Advanced Sessions and Archives",
                          style: TextStyle(color: Colors.white70, fontSize: 13),
                        ),
                        trailing: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.green.shade900,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Obx((){
                            if (subscriptionController.isSubscriptiopnExpired.value){
                              return Text(
                                "Active",
                                style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
                              );
                            }
                            else {
                              return Text(
                              "Active",
                              style: TextStyle(color: Color(0xFF9CFE4F), fontWeight: FontWeight.bold),
                            );
                            }
                          })
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.calendar_today, size: 16, color: Colors.redAccent),
                                  const SizedBox(width: 6),
                                  Text("Started : ${subscriptionController.subscriptionData['startDate']}", style: const TextStyle(color: Colors.white70)),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(Icons.calendar_today, size: 16, color: Colors.redAccent),
                                  SizedBox(width: 6),
                                  Text("Expires : ${subscriptionController.subscriptionData['endDate']}", style: TextStyle(color: Colors.white70)),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.hourglass_bottom, size: 16, color: Colors.amber),
                              SizedBox(width: 6),
                              Text("${subscriptionController.subscriptionData['daysLeft']} Days Left", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
            }),

            // Membership Active Banner
            Obx((){
              if (subscriptionController.isSubscriptionActive.value){
                return Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: const Color(0xFF9CFE4F)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.verified, color: Color(0xFF9CFE4F)),
                      SizedBox(width: 10),
                      Text(
                        "Your Membership is Active",
                        style: TextStyle(color: Color(0xFF9CFE4F), fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                );
              }
              else {
                return Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.redAccent),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.close, color: Colors.redAccent),
                      SizedBox(width: 10),
                      Text(
                        "No subscription found for you",
                        style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                );
              }
            })
          ],
        ),
      ),

    );
  }
}
