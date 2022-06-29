import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reservation/constants/my_colors.dart';
import 'package:reservation/constants/my_routes.dart';
import 'package:reservation/presentation/widgets/container_widget.dart';
import 'package:reservation/presentation/widgets/elevated_widget.dart';
import 'package:reservation/presentation/widgets/home/product_info.dart';
import 'package:reservation/presentation/widgets/image_details.dart';
import 'package:reservation/presentation/widgets/text_utils.dart';

class ProductDetails extends StatelessWidget {
  final DocumentSnapshot myData;

  const ProductDetails({Key? key, required this.myData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('equipments').snapshots(),
      builder: (context, snapshot) {
        // DocumentSnapshot myData = snapshot.data!.docs[].toString();

        if (snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: TextUtils(
                  text: myData['name'],
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 22),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  imageDetails(
                    imageUrl: myData['image'],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Container(
                    width: double.infinity,
                    height: 340,
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 24),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 TextUtils(
                                  text: myData['name'],
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                                Row(
                                  children: [
                                    containerWidget(
                                        text: myData['booking_status'],
                                        backgroundColor: MyColors.kGreenColor,
                                        colorText: Colors.white,
                                        borderColor: MyColors.kGreenColor),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    containerWidget(
                                      text: myData['category_name'],
                                      backgroundColor: MyColors.kPrimaryColor,
                                      colorText: Colors.white,
                                      borderColor: MyColors.kPrimaryColor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: const [
                                TextUtils(
                                  text: 'التفاصيل',
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            productInfo(
                                textInfo:
                                    'الجهاز متاح في جميع الأماكن والجامعات وهو مهم جدا جدا'),
                            const SizedBox(height: 5),
                            productInfo(
                                textInfo:
                                    'الجهاز متاح في جميع الأماكن والجامعات وهو مهم جدا جدا'),
                            const SizedBox(height: 5),
                            productInfo(
                                textInfo:
                                    'الجهاز متاح في جميع الأماكن والجامعات وهو مهم جدا جدا'),
                            const SizedBox(height: 5),
                            productInfo(
                                textInfo:
                                    'الجهاز متاح في جميع الأماكن والجامعات وهو مهم جدا جدا'),
                            const SizedBox(
                              height: 15,
                            ),
                            elevatedWidget(
                              title: 'إحجز الأن',
                              color: MyColors.kPrimaryColor,
                              onPressed: () {
                                Navigator.pushNamed(context, dateScreen);
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
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
