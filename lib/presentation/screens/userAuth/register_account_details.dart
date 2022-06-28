import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reservation/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:reservation/constants/my_colors.dart';
import 'package:reservation/constants/my_pictures.dart';
import 'package:reservation/constants/my_routes.dart';
import 'package:reservation/constants/my_string.dart';
import 'package:reservation/presentation/widgets/elevated_widget.dart';
import 'package:reservation/presentation/widgets/text_field_widget.dart';
import 'package:reservation/presentation/widgets/text_utils.dart';

class RegisterAccountDetails extends StatefulWidget {
  const RegisterAccountDetails({Key? key}) : super(key: key);

  @override
  State<RegisterAccountDetails> createState() => _RegisterAccountDetailsState();
}

class _RegisterAccountDetailsState extends State<RegisterAccountDetails> {
  final TextEditingController _phoneTextController = TextEditingController();

  final TextEditingController _nameTextController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  late String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.kPrimaryColor,
      appBar: AppBar(
        title: const TextUtils(
          text: 'إنشاء حساب',
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
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(top: 25),
                alignment: Alignment.center,
                child: SvgPicture.asset(MyPictures.passwordLogo),
              ),
              const SizedBox(
                height: 90,
              ),
              Container(
                width: double.infinity,
                height: 300,
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
                    vertical: 15,
                  ),
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: TextUtils(
                              text: 'إسم المستخدم',
                              color: MyColors.kPrimaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          textFieldWidget(
                            controller: _nameTextController,
                            validator: (value) {
                              if (value.toString().length < 2 ||
                                  !RegExp(validationName).hasMatch(value)) {
                                return 'ادخل اسم غير مستخدم';
                              } else {
                                return null;
                              }
                            },
                            hintText: 'إسم المستخدم',
                            textInputType: TextInputType.emailAddress,
                            colorSide: MyColors.kPrimaryColor.withOpacity(0.8),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: TextUtils(
                              text: 'رقم الهاتف',
                              color: MyColors.kPrimaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          textFieldWidget(
                            controller: _phoneTextController,
                            maxLength: 10,
                            validator: (value) {
                              if (value.toString().length < 10 &&
                                  !RegExp(validationPhone).hasMatch(value)) {
                                return 'رقم الهاتف خاطئ';
                              } else {
                                return null;
                              }
                            },
                            hintText: 'رقم الهاتف',
                            textInputType: TextInputType.phone,
                            colorSide: MyColors.kPrimaryColor.withOpacity(0.8),
                            onSaved: (value) {
                              phoneNumber = value!;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          elevatedWidget(
                            title: 'تسجيل الدخول',
                            color: MyColors.kPrimaryColor,
                            onPressed: () async {
                              // if (formKey.currentState!.validate()) {
                              //   String phone =
                              //       _phoneTextController.text.toString();
                              //   String name = _nameTextController.text.trim();
                              // }
                              // Navigator.pushNamed(context, otpScreen);

                              showProgressIndicator(context);

                              _register(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              BlocListener<PhoneAuthCubit, PhoneAuthState>(
                listenWhen: (previous, current) {
                  return previous != current;
                },
                listener: (context, state) {
                  if (state is Loading) {
                    showProgressIndicator(context);
                  }
                  if (state is PhoneNumberSubmitted) {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, otpScreen,
                        arguments: phoneNumber);
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

  Future<void> _register(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      Navigator.pop(context);
      return;
    } else {
      Navigator.pop(context);
      formKey.currentState!.save();
      BlocProvider.of<PhoneAuthCubit>(context).submitPhoneNumber(phoneNumber);
    }
  }
}
