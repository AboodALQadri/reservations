import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reservation/constants/my_colors.dart';
import 'package:reservation/constants/my_pictures.dart';
import 'package:reservation/constants/my_routes.dart';
import 'package:reservation/constants/my_string.dart';
import 'package:reservation/presentation/widgets/elevated_widget.dart';
import 'package:reservation/presentation/widgets/text_field_widget.dart';
import 'package:reservation/presentation/widgets/text_utils.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailTextController = TextEditingController();

  final TextEditingController _passwordTextController = TextEditingController();

  final TextEditingController _confirmPasswordTextController =
      TextEditingController();

  bool _isVisibility = true;

  bool _confirmIsVisibility = true;

  final fromKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

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
              // const PageColor(),
              Container(
                margin: const EdgeInsets.only(top: 25),
                alignment: Alignment.center,
                child: SvgPicture.asset(MyPictures.registerLogo),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                height: 370,
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
                    key: fromKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: TextUtils(
                              text: 'البريد الألكتروني',
                              color: MyColors.kPrimaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          textFieldWidget(
                            controller: _emailTextController,
                            validator: (value) {
                              if (!RegExp(validationEmail).hasMatch(value)) {
                                return 'بريد إلكتروني خاطئ';
                              } else {
                                return null;
                              }
                            },
                            hintText: 'البريد الألكتروني',
                            textInputType: TextInputType.emailAddress,
                            colorSide: MyColors.kPrimaryColor.withOpacity(0.8),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: TextUtils(
                              text: 'كلمة المرور',
                              color: MyColors.kPrimaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          textFieldWidget(
                            controller: _passwordTextController,
                            validator: (value) {
                              if (value.toString().length < 5) {
                                return 'يجب أن تكون كلمة المرور أطول من 5 أحرف';
                              } else {
                                return null;
                              }
                            },
                            hintText: 'كلمة المرور',
                            textInputType: TextInputType.text,
                            colorSide: MyColors.kPrimaryColor.withOpacity(0.8),
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
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: TextUtils(
                              text: 'تأكيد كلمة المرور',
                              color: MyColors.kPrimaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          textFieldWidget(
                            controller: _confirmPasswordTextController,
                            validator: (value) {
                              if (_confirmPasswordTextController.text !=
                                  _passwordTextController.text) {
                                return 'كلمة المرور التأكيدية غير صحيحة';
                              } else {
                                return null;
                              }
                            },
                            hintText: 'تأكيد كلمة المرور',
                            textInputType: TextInputType.text,
                            colorSide: MyColors.kPrimaryColor.withOpacity(0.8),
                            obscureText: _confirmIsVisibility,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _confirmIsVisibility = !_confirmIsVisibility;
                                });
                              },
                              icon: _confirmIsVisibility
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
                            height: 20,
                          ),
                          elevatedWidget(
                            title: 'تسجيل الدخول',
                            color: MyColors.kPrimaryColor,
                            onPressed: () async {
                              if (fromKey.currentState!.validate()) {
                                String email = _emailTextController.text.trim();
                                String password = _passwordTextController.text;
                                String confirmPassword =
                                    _confirmPasswordTextController.text;
                                try {
                                  final newUser = await _auth
                                      .createUserWithEmailAndPassword(
                                    email: _emailTextController.text,
                                    password: _passwordTextController.text,
                                  );
                                  Navigator.pushNamed(
                                      context, registerAccountDetails);
                                } catch (error) {
                                  print(error);
                                }
                              }
                            },
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
}
