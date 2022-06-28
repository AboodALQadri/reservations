import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:reservation/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:reservation/constants/my_colors.dart';
import 'package:reservation/constants/my_pictures.dart';
import 'package:reservation/constants/my_routes.dart';
import 'package:reservation/presentation/widgets/elevated_widget.dart';
import 'package:reservation/presentation/widgets/text_utils.dart';

class OtpScreen extends StatelessWidget {
  final phoneNumber;

  OtpScreen({super.key, required this.phoneNumber});

  late String otpCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.kPrimaryColor,
      appBar: AppBar(
        title: const TextUtils(
          text: 'تأكيد الحساب',
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 22,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ScreenStyle(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(top: 25),
                alignment: Alignment.center,
                child: SvgPicture.asset(MyPictures.confirmLogo),
              ),
              const SizedBox(
                height: 70,
              ),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 330,
                    decoration: BoxDecoration(
                      color: const Color(0xff0A0A0A).withOpacity(0.2),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 25,
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  const TextUtils(
                                    text: 'تأكيد الحساب',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  TextUtils(
                                    text: 'لقد تم إرسال رمز تأكيد إلى الايميل',
                                    color: MyColors.kWhiteColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                  TextUtils(
                                    text: 'الخاص بك',
                                    color: MyColors.kWhiteColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  PinCodeTextField(
                                    appContext: context,
                                    autoFocus: true,
                                    keyboardType: TextInputType.number,
                                    obscureText: false,

                                    length: 6,
                                    cursorColor: Colors.black,
                                    animationType: AnimationType.fade,
                                    pinTheme: PinTheme(
                                      shape: PinCodeFieldShape.box,
                                      borderRadius: BorderRadius.circular(10),
                                      fieldHeight: 45,
                                      fieldWidth: 60,
                                      activeFillColor: MyColors.kWhiteColor,
                                      activeColor: MyColors.kWhiteColor,
                                      selectedColor: MyColors.kWhiteColor,
                                      selectedFillColor: MyColors.kWhiteColor,
                                      inactiveFillColor: MyColors.kWhiteColor,
                                      disabledColor: MyColors.kWhiteColor,
                                      errorBorderColor: MyColors.kWhiteColor,
                                      inactiveColor: MyColors.kWhiteColor,
                                    ),

                                    animationDuration:
                                        const Duration(milliseconds: 300),
                                    backgroundColor: Colors.transparent,
                                    enableActiveFill: true,
                                    // errorAnimationController: errorController,
                                    // controller: textEditingController,
                                    onCompleted: (submittedCode) {
                                      otpCode = submittedCode;
                                      print("Completed");
                                    },
                                    onChanged: (value) {
                                      print(value);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          elevatedWidget(
                            title: 'تأكيد الحساب',
                            color: MyColors.kPrimaryColor,
                            onPressed: () {
                              // Navigator.pushNamed(context, confirmSuccess);

                              showProgressIndicator(context);

                              _login(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              BlocListener<PhoneAuthCubit, PhoneAuthState>(
                listenWhen: (previous, current) {
                  return previous != current;
                },
                listener: (context, state) {
                  if (state is Loading) {
                    showProgressIndicator(context);
                  }
                  if (state is PhoneOTPVerified) {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, confirmSuccess);
                  }
                  if (state is ErrorOccurred) {
                    // Navigator.pop(context);
                    String errorMsg = (state).errorMsg;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(errorMsg),
                        backgroundColor: Colors.black,
                        duration: Duration(seconds: 3),
                      ),
                    );
                  }
                },
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    BlocProvider.of<PhoneAuthCubit>(context).submitOTP(otpCode);
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
