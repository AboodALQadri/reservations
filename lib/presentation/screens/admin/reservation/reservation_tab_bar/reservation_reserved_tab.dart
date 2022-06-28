import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reservation/constants/my_routes.dart';
import 'package:reservation/presentation/widgets/adminWidgets/reservation/reservation_list_tile_widget.dart';

class ReservationReservedTab extends StatelessWidget {
  const ReservationReservedTab({Key? key}) : super(key: key);

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
                  height: 800,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    itemCount: snapshot.data!.docs.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemBuilder: (context, index) {
                      DocumentSnapshot myData = snapshot.data!.docs[index];

                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, reservationProductDetails , arguments: myData);
                        },
                        child: reservationListTileWidget(
                            imageUrl: myData['image'],
                            title: myData['equipment_name'],
                            subtitle: 'من ${myData['user_name']}  ',
                            state: 'قبول'),
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
