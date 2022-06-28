import 'package:flutter/material.dart';
import 'package:reservation/constants/my_colors.dart';
import 'package:reservation/presentation/screens/admin/home/all_products_tab.dart';
import 'package:reservation/presentation/screens/admin/home/products_available_tab.dart';
import 'package:reservation/presentation/screens/admin/home/products_reserved_tab.dart';
import 'package:reservation/presentation/widgets/text_utils.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen>
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
                text: 'الكل',
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
          AllProductsTab(),
          ProductsAvailableTab(),
          ProductsReservedTab(),
        ],
      ),
    );
  }
}
