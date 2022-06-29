import 'package:flutter/material.dart';
import 'package:reservation/constants/my_colors.dart';
import 'package:reservation/presentation/widgets/notification/notification_list_tile_widget.dart';

class AdminNotificationScreen extends StatelessWidget {
  const AdminNotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 600,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return notificationListTileWidget(
                  title: 'التنبيه الأول',
                  subTitle: 'محتوى التنبيه',
                  textHours: 'منذ 4 ساعات',
                  iconColor: MyColors.kGreenColor,
                  containerColor: MyColors.kGreenColor,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
