import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reservation/constants/my_colors.dart';
import 'package:reservation/constants/my_pictures.dart';
import 'package:reservation/constants/my_routes.dart';
import 'package:reservation/presentation/widgets/elevated_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.kPrimaryColor,
      body: ScreenStyle(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  alignment: Alignment.center,
                  child: SvgPicture.asset(MyPictures.logoName),
                ),
                const SizedBox(
                  height: 200,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      elevatedWidget(
                        title: 'تسجيل كمستخدم',
                        color: MyColors.kPrimaryColor,
                        borderSideColor: MyColors.kPrimaryColor,
                        onPressed: () {
                          Navigator.pushNamed(context, userLoginScreen);
                        },
                      ),
                      elevatedWidget(
                        title: 'تسجيل كمشرف',
                        color: MyColors.kGreenColor,
                        borderSideColor: MyColors.kGreenColor,
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, adminSplashScreen);
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
