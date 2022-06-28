import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reservation/constants/my_colors.dart';
import 'package:reservation/constants/my_pictures.dart';
import 'package:reservation/constants/my_routes.dart';
import 'package:reservation/presentation/widgets/elevated_widget.dart';

class UserLoginScreen extends StatelessWidget {
  const UserLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenStyle(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 110,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  alignment: Alignment.center,
                  child: SvgPicture.asset(MyPictures.logoName),
                ),
                const SizedBox(
                  height: 180,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      elevatedWidget(
                        title: 'تسجيل الدخول',
                        color: MyColors.kPrimaryColor,
                        onPressed: () {
                          Navigator.pushNamed(context, loginScreen);
                        },
                      ),
                      elevatedWidget(
                        title: 'إنشاء حساب',
                        color: Colors.transparent,
                        onPressed: () {
                          Navigator.pushNamed(context, registerScreen);
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
