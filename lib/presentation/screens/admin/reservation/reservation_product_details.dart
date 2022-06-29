import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reservation/constants/my_colors.dart';
import 'package:reservation/presentation/widgets/adminWidgets/reservation/reservation_container_widget.dart';
import 'package:reservation/presentation/widgets/adminWidgets/reservation/reservation_elevated_widget.dart';
import 'package:reservation/presentation/widgets/container_widget.dart';
import 'package:reservation/presentation/widgets/image_details.dart';
import 'package:reservation/presentation/widgets/text_utils.dart';

class ReservationProductDetails extends StatelessWidget {
  final DocumentSnapshot myData;

  const ReservationProductDetails({Key? key, required this.myData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: MyColors.kGreenColor,
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 90,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextUtils(
                        text: myData['equipment_name'],
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      TextUtils(
                        text: myData['user_name'],
                        color: MyColors.kWhiteColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ],
                  ),
                  containerWidget(
                    text: myData['status'],
                    colorText: Colors.white,
                    backgroundColor: MyColors.kGreenColor,
                    borderColor: MyColors.kGreenColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: [
                  reservationContainerWidget(
                    text: 'اسم الحاجز : ${myData['user_name']}',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  reservationContainerWidget(
                    text: ' بداية الحجز : ${myData['booking_time']}',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  reservationContainerWidget(
                    text: 'نهاية الحجز : ${myData['return_time']}',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      reservationElevatedWidget(
                        title: 'قبول',
                        color: MyColors.kGreenColor,
                        borderSideColor: MyColors.kGreenColor,
                        onPressed: () {},
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      reservationElevatedWidget(
                        title: 'رفض',
                        color: MyColors.kRedColor,
                        borderSideColor: MyColors.kRedColor,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
