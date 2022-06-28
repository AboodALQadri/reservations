import 'package:flutter/material.dart';
import 'package:reservation/constants/my_colors.dart';
import 'package:reservation/presentation/screens/home/home_tab_bar/all_devices_tab.dart';
import 'package:reservation/presentation/screens/home/home_tab_bar/available_tab.dart';
import 'package:reservation/presentation/screens/home/home_tab_bar/borrowed_tab.dart';
import 'package:reservation/presentation/widgets/text_utils.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
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
                text: 'جميع الأجهزة',
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
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
                text: 'المستعارة',
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
          AllDevicesTab(),
          AvailableTab(),
          BorrowedTab(),
        ],
      ),
    );
  }
}
