import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reservation/constants/my_colors.dart';
import 'package:reservation/constants/my_routes.dart';
import 'package:reservation/presentation/widgets/container_widget.dart';
import 'package:reservation/presentation/widgets/home/product_list_tile_widget.dart';

class AvailableTab extends StatefulWidget {
  const AvailableTab({Key? key}) : super(key: key);

  @override
  State<AvailableTab> createState() => _AvailableTabState();
}

class _AvailableTabState extends State<AvailableTab> {
  int currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 50,
            width: 70,
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('categories')
                  .snapshots(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return ListView.separated(
                    itemCount: snapshot.data!.docs.length,
                    padding: const EdgeInsets.only(right: 15, top: 15),
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                    itemBuilder: (context, index) {
                      DocumentSnapshot myData = snapshot.data!.docs[index];

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            currentSelected = index;
                          });
                        },
                        child: containerWidget(
                          borderColor: MyColors.kPrimaryColor,
                          text: myData['name'],
                          backgroundColor: currentSelected == index
                              ? MyColors.kPrimaryColor
                              : Colors.white,
                          colorText: currentSelected == index
                              ? Colors.white
                              : MyColors.kPrimaryColor,
                        ),
                      );
                    },
                  );
                }else{
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              height: 600,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('equipments')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      // itemCount: snapshot.data.hashCode.bitLength,
                      // itemCount: snapshot.data!.id.length,
                      itemCount: snapshot.data!.docs.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 5,
                        );
                      },
                      itemBuilder: (context, index) {
                        DocumentSnapshot myData = snapshot.data!.docs[index];
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, productDetails , arguments: myData);
                          },
                          child: productListTileWidget(
                            imageUrl: myData['image'],
                            // title: snapshot.data!.id.contains('name').toString(),
                            title: myData['name'],
                            subtitle: myData['supervisor_name'],
                            stateText: myData['booking_status'].toString(),
                            textBackGroundColor: MyColors.kPrimaryColor,
                            borderColor: MyColors.kPrimaryColor,
                          ),
                        );
                      },
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              )),
        ],
      ),
    );

  }
}
