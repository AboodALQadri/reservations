import 'package:flutter/material.dart';
import 'package:reservation/constants/my_colors.dart';
import 'package:reservation/presentation/screens/admin/reservation/reservation_tab_bar/reservation_available_tab.dart';
import 'package:reservation/presentation/screens/admin/reservation/reservation_tab_bar/reservation_reserved_tab.dart';
import 'package:reservation/presentation/screens/admin/reservation/reservation_tab_bar/reservation_under_examination_tab.dart';
import 'package:reservation/presentation/widgets/text_utils.dart';
class AdminReservationScreen extends StatefulWidget {
  const AdminReservationScreen({Key? key}) : super(key: key);

  @override
  State<AdminReservationScreen> createState() => _AdminReservationScreenState();
}

class _AdminReservationScreenState extends State<AdminReservationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.kGreenColor,
        elevation: 5,
        toolbarHeight: 20,
        bottom: TabBar(
          indicatorColor: MyColors.kTabColor,
          controller: _tabController,
          onTap: (int value) {
            setState(() {
              _tabController.index = value;
            });
          },
          tabs: const [
            Tab(
              child: TextUtils(
                text: 'المتاحة',
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            Tab(
              child: TextUtils(
                text: 'قيد الفحص',
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            Tab(
              child: TextUtils(
                text: 'المحجوزة',
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ReservationAvailableTab(),
          ReservationUnderExaminationTab(),
          ReservationReservedTab(),
        ],
      ),
    );
  }
}
