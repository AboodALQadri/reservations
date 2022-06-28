import 'package:flutter/material.dart';
import 'package:reservation/constants/my_colors.dart';
import 'package:reservation/constants/my_routes.dart';
import 'package:reservation/presentation/widgets/elevated_widget.dart';
import 'package:reservation/presentation/widgets/text_utils.dart';

class DateScreen extends StatefulWidget {
  const DateScreen({Key? key}) : super(key: key);

  @override
  State<DateScreen> createState() => _DateScreenState();
}

class _DateScreenState extends State<DateScreen> {
  DateTime _selectDate = DateTime.now();

  final firstDate = DateTime(2010, 1);
  final lastDate = DateTime(2023, 12);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextUtils(
          text: 'إحجز الان',
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 22,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            TextUtils(
              text: '$_selectDate'.split(' ')[0],
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            const Divider(),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: const [
                  TextUtils(
                    text: 'إختر تاريخ الموعد',
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            CalendarDatePicker(
              initialDate: _selectDate,
              firstDate: firstDate,
              lastDate: lastDate,
              onDateChanged: (newDate) {
                setState(() {
                  _selectDate = newDate;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: elevatedWidget(
                title: 'أكد الأن',
                color: MyColors.kPrimaryColor,
                onPressed: () {
                  Navigator.pushNamed(context, confirmAppointmentScreen);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
