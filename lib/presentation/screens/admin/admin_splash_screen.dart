import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reservation/constants/my_colors.dart';
import 'package:reservation/constants/my_pictures.dart';
import 'package:reservation/constants/my_routes.dart';

class AdminSplashScreen extends StatefulWidget {
  const AdminSplashScreen({Key? key}) : super(key: key);

  @override
  State<AdminSplashScreen> createState() => _AdminSplashScreenState();
}

class _AdminSplashScreenState extends State<AdminSplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, adminLoginScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.kGreenColor,
      body: AdminScreenStyle(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 250,
              ),
              Center(
                child: SvgPicture.asset(MyPictures.logoName),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
