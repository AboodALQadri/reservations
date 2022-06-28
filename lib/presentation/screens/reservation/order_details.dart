import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reservation/constants/my_colors.dart';
import 'package:reservation/constants/my_routes.dart';
import 'package:reservation/presentation/widgets/container_widget.dart';
import 'package:reservation/presentation/widgets/elevated_widget.dart';
import 'package:reservation/presentation/widgets/image_details.dart';
import 'package:reservation/presentation/widgets/reservation/container_day_widget.dart';
import 'package:reservation/presentation/widgets/text_utils.dart';

class OrderDetails extends StatelessWidget {
  final DocumentSnapshot myData;

  const OrderDetails({Key? key, required this.myData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextUtils(
            text: myData['equipment_name'],
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 22),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            imageDetails(
              imageUrl: myData['image'],
            ),
            const SizedBox(
              height: 2,
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
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           TextUtils(
                            text: myData['equipment_name'],
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                          Row(
                            children: [
                              containerWidget(
                                  text: 'لابتوبات',
                                  backgroundColor: MyColors.kPrimaryColor,
                                  colorText: Colors.white,
                                  borderColor: MyColors.kPrimaryColor),
                              const SizedBox(
                                width: 15,
                              ),
                              containerWidget(
                                text: 'متاح',
                                backgroundColor: MyColors.kGreenColor,
                                colorText: Colors.white,
                                borderColor: MyColors.kGreenColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children:  [
                          TextUtils(
                            text: 'اسم المسؤول : ${myData['supervisor_name']}',
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          containerDayWidget(
                            textDayTime: myData['booking_time'],
                            borderColor: MyColors.kPrimaryColor,
                            dayTextColor: MyColors.kPrimaryColor,
                            timeColor: MyColors.kPrimaryColor,
                            timeText: 'وقت الحجز',
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          containerDayWidget(
                            textDayTime: myData['return_time'],
                            borderColor: MyColors.kPurpleColor,
                            dayTextColor: MyColors.kPurpleColor,
                            timeColor: MyColors.kPurpleColor,
                            timeText: 'وقت الترجيع',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      elevatedWidget(
                        title: 'أرجع الأن',
                        color: MyColors.kPrimaryColor,
                        onPressed: () {
                          Navigator.pushNamed(context, orderReturn , arguments: myData);
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
