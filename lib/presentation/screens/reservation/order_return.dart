import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reservation/constants/my_colors.dart';
import 'package:reservation/constants/my_routes.dart';
import 'package:reservation/presentation/widgets/elevated_widget.dart';
import 'package:reservation/presentation/widgets/image_details.dart';
import 'package:reservation/presentation/widgets/reservation/container_return_widget.dart';
import 'package:reservation/presentation/widgets/text_utils.dart';
class OrderReturn extends StatelessWidget {
  final DocumentSnapshot myData;

  const OrderReturn({Key? key, required this.myData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            imageDetails(
              imageUrl:
                  myData['image'],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 360,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 0.1,
                    blurStyle: BlurStyle.inner,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          const TextUtils(
                            text: 'تم إنهاء الحجز',
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 29,
                          ),
                          TextUtils(
                            text: 'شكرا على الإرجاع',
                            color: MyColors.kWhiteColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          containerReturnWidget(
                            textReturnTime: 'الوقت المنقضي',
                            textDay: myData['booking_time'],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          containerReturnWidget(
                            textReturnTime: 'الوقت المتبقي',
                            textDay: myData['return_time'],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      elevatedWidget(
                        title: 'أرجع إلى الحجوزات',
                        color: MyColors.kPrimaryColor,
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, mainScreen, (route) => false);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
