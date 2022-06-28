import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reservation/constants/my_colors.dart';
import 'package:reservation/models/bn_item.dart';
import 'package:reservation/presentation/screens/admin/admin_home_screen.dart';
import 'package:reservation/presentation/screens/admin/admin_notification_screen.dart';
import 'package:reservation/presentation/screens/admin/admin_person_screen.dart';
import 'package:reservation/presentation/screens/admin/admin_reservation_screen.dart';
import 'package:reservation/presentation/widgets/text_utils.dart';
import 'package:reservation/utils/data_search.dart';

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({Key? key, required DocumentSnapshot? myData})
      : super(key: key);

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  static late final DocumentSnapshot? myData;

  int _currentIndex = 0;
  final List<BnItem> _bnItem = <BnItem>[
    BnItem(title: 'الأجهزة', widget: const AdminHomeScreen()),
    BnItem(title: 'الحجوزات', widget: const AdminReservationScreen()),
    BnItem(title: 'التنبيهات', widget: const AdminNotificationScreen()),
    BnItem(title: 'الصفحة الشخصية', widget: AdminPersonScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: MyColors.kGreenColor,
        title: TextUtils(
          text: _bnItem[_currentIndex].title,
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 22,
        ),
        actions: [
          Visibility(
            visible: _currentIndex == 0 || _currentIndex == 1,
            child: IconButton(
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
              icon: const Icon(Icons.search),
            ),
          ),
        ],
        elevation: 0,
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: MyColors.kGreenColor,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
            ),
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'الأجهزة',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.library_books,
            ),
            icon: Icon(
              Icons.library_books_outlined,
            ),
            label: 'الحجوزات',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.notifications,
            ),
            icon: Icon(
              Icons.notifications_outlined,
            ),
            label: 'التنبيهات',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.person,
            ),
            icon: Icon(
              Icons.person_outline,
            ),
            label: 'الصفحة الشخصية',
          ),
        ],
      ),
      body: _bnItem[_currentIndex].widget,
    );
  }
}
