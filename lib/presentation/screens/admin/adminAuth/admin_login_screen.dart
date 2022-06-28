import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reservation/business_logic/cubit/admin_login_auth/admin_login_auth_cubit.dart';
import 'package:reservation/constants/my_colors.dart';
import 'package:reservation/constants/my_pictures.dart';
import 'package:reservation/constants/my_string.dart';
import 'package:reservation/presentation/widgets/elevated_widget.dart';
import 'package:reservation/presentation/widgets/text_field_widget.dart';
import 'package:reservation/presentation/widgets/text_utils.dart';
import 'package:reservation/utils/helper.dart';

import '../../../../constants/my_routes.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({Key? key}) : super(key: key);

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> with Helpers {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  bool _isVisibility = true;

  final fromKey = GlobalKey<FormState>();

  String email = '';
  var password = '';

  @override
  Widget build(BuildContext context) {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('supervisors');

    return Scaffold(
      backgroundColor: MyColors.kGreenColor,
      appBar: AppBar(
        title: const TextUtils(
          text: 'تسجيل الدخول',
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 22,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: AdminScreenStyle(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                alignment: Alignment.center,
                child: SvgPicture.asset(MyPictures.logoName),
              ),
              const SizedBox(
                height: 80,
              ),
              Container(
                width: double.infinity,
                height: 350,
                decoration: BoxDecoration(
                  color: const Color(0xff0A0A0A).withOpacity(0.2),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  child: Form(
                    key: fromKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: TextUtils(
                              text: 'البريد الألكتروني',
                              color: MyColors.kGreenColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          textFieldWidget(
                            controller: _emailTextController,
                            onChanged: (value) {
                              email = value.toString();
                            },
                            validator: (value) {
                              if (!RegExp(validationEmail).hasMatch(value)) {
                                return 'بريد إلكتروني خاطئ';
                              } else {
                                return null;
                              }
                            },
                            hintText: 'البريد الألكتروني',
                            textInputType: TextInputType.emailAddress,
                            colorSide: MyColors.kGreenColor.withOpacity(0.8),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: TextUtils(
                              text: 'كلمة المرور',
                              color: MyColors.kGreenColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          textFieldWidget(
                            controller: _passwordTextController,
                            onChanged: (value) {
                              password = value.toString();
                            },
                            validator: (value) {
                              if (value.toString().length < 5) {
                                return 'يجب أن تكون كلمة المرور أطول من 5 أحرف';
                              } else {
                                return null;
                              }
                            },
                            hintText: 'كلمة المرور',
                            textInputType: TextInputType.text,
                            colorSide: MyColors.kGreenColor.withOpacity(0.8),
                            obscureText: _isVisibility,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isVisibility = !_isVisibility;
                                });
                              },
                              icon: _isVisibility
                                  ? const Icon(
                                      Icons.visibility,
                                      color: Colors.white,
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                      color: Colors.white,
                                    ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          elevatedWidget(
                              title: 'تسجيل الدخول',
                              color: MyColors.kGreenColor,
                              borderSideColor: MyColors.kGreenColor,
                              onPressed: () async {
                                if (fromKey.currentState!.validate()) {
                                  String email =
                                      _emailTextController.text.trim();
                                  String password =
                                      _passwordTextController.text;
                                }

                                // AdminLoginAuthCubit.get(context).getData(
                                //     context: context,
                                //     email: _emailTextController.text,
                                //     password: _passwordTextController.text);

                                _login(context);
                              }),
                          BlocListener<AdminLoginAuthCubit,
                              AdminLoginAuthState>(
                            listenWhen: (previous, current) {
                              return previous != current;
                            },
                            listener: (context, state) {
                              if (state is Loading) {
                                showProgressIndicator(context);
                              }
                              if (state is AdminSubmitted) {
                                // Navigator.pop(context);
                                Navigator.pushNamedAndRemoveUntil(
                                    context, adminMainScreen, (route) => false);

                                showSnackBar(context,
                                    message: 'Hey Admin', error: false);
                              } else {
                                // Navigator.pop(context);
                                // showSnackBar(context,
                                //     message: 'Hey Admin', error: false);
                              }
                              if (state is ErrorMsg) {
                                Navigator.pop(context);
                                String errorMsg = (state).errorMsg;
                                showSnackBar(context,
                                    message: errorMsg.toString(), error: true);
                              }
                            },
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    BlocProvider.of<AdminLoginAuthCubit>(context).getData(
      context: context,
      email: _emailTextController.text,
      password: _passwordTextController.text,
    );
  }

  void showProgressIndicator(BuildContext context) {
    AlertDialog alertDialog = const AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ),
      ),
    );
    showDialog(
      barrierColor: Colors.white.withOpacity(0),
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return alertDialog;
      },
    );
  }
}
// Start --------------------------------
// Future<void> getData(
//     {required String email,
//     required String password}) async {
//   // Get docs from collection reference
//   QuerySnapshot querySnapshot =
//       await collectionRef.get();
//   // Get data from docs and convert map to List
//   final allData = querySnapshot.docs
//       .map((doc) => doc.data())
//       .toList();
//   print(allData);
//   Map<String, dynamic>? firstItem = allData
//       .elementAt(0) as Map<String, dynamic>?;
//   Map<String, dynamic>? secondItem = allData
//       .elementAt(1) as Map<String, dynamic>?;
//   Map<String, dynamic>? thirdItem =
//   allData.elementAt(2) as Map<String, dynamic>?;
//   // first email and password
//   final String firstEmail = firstItem!['email'];
//   final String firstPassword =
//       firstItem['password'];
//
//   // second email and password
//   final String secondEmail = secondItem!['email'];
//   final String secondPassword =
//       secondItem['password'];
//
//   // second email and password
//   final String thirdEmail = thirdItem!['email'];
//   final String thirdPassword = thirdItem['password'];
//
//   print(
//       'Email is $firstEmail : Password is $firstPassword');
//   print(
//       'Email is $secondEmail : Password is $secondPassword');
//   print(
//       'Email is $thirdEmail : Password is $thirdPassword');
//
//
//   if (email == firstEmail &&
//           password == firstPassword ||
//       email == secondEmail &&
//           password == secondPassword) {
//     Navigator.pushNamedAndRemoveUntil(context,
//         adminMainScreen, (route) => false);
//   }
// }
// // End ---------------------------------------------
// getData(
//     email: _emailTextController.text,
//
