import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reservation/constants/my_routes.dart';
import 'package:reservation/presentation/widgets/reservation/list_tile_widget.dart';

class AllReservationTab extends StatefulWidget {
  const AllReservationTab({Key? key}) : super(key: key);

  @override
  State<AllReservationTab> createState() => _AllReservationTabState();
}

class _AllReservationTabState extends State<AllReservationTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('reservations').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                SizedBox(
                  height: 550,
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

                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, orderDetails , arguments: myData);
                        },
                        child: listTileWidget(
                          imageUrl:
                              myData['image'],
                          title: myData['equipment_name'],
                          subtitle: 'تم الارسال قبل ${myData['booking_time']}',
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
