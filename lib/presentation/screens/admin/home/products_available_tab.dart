import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reservation/constants/my_colors.dart';
import 'package:reservation/presentation/widgets/home/product_list_tile_widget.dart';

class ProductsAvailableTab extends StatefulWidget {
  const ProductsAvailableTab({Key? key}) : super(key: key);

  @override
  State<ProductsAvailableTab> createState() => _ProductsAvailableTabState();
}

class _ProductsAvailableTabState extends State<ProductsAvailableTab> {
  int currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('equipments').where('booking_status' , isEqualTo: 'متاح').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 530,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: snapshot.data!.docs.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 5,
                      );
                    },
                    itemBuilder: (context, index) {
                      DocumentSnapshot myData = snapshot.data!.docs[index];

                      return productListTileWidget(
                        imageUrl: myData['image'],
                        title: myData['name'],
                        subtitle: myData['supervisor_name'],
                        stateText: myData['booking_status'].toString(),
                        textBackGroundColor: MyColors.kGreenColor,
                        borderColor: MyColors.kGreenColor,
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
