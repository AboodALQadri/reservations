import 'package:flutter/material.dart';
import 'package:reservation/constants/my_colors.dart';
import 'package:reservation/presentation/screens/reservation/reservation_tab_bar/accepted_tab.dart';
import 'package:reservation/presentation/screens/reservation/reservation_tab_bar/all_reservation_tab.dart';
import 'package:reservation/presentation/screens/reservation/reservation_tab_bar/under_review_tab.dart';
import 'package:reservation/presentation/widgets/text_utils.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen>
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
        backgroundColor: MyColors.kPrimaryColor,
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
                text: 'الكل',
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            Tab(
              child: TextUtils(
                text: 'قيد المراجعة',
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            Tab(
              child: TextUtils(
                text: 'المقبولة',
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
          AllReservationTab(),
          UnderReviewTab(),
          AcceptedTab(),
        ],
      ),
    );
  }
}
