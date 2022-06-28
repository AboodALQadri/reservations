import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:reservation/constants/my_routes.dart';
import 'package:reservation/utils/helper.dart';

part 'admin_login_auth_state.dart';

class AdminLoginAuthCubit extends Cubit<AdminLoginAuthState> with Helpers {
  late String email;
  late String password;

  CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('supervisors');

  AdminLoginAuthCubit() : super(AdminLoginAuthInitial());

  static AdminLoginAuthCubit get(context) => BlocProvider.of(context);

  Future<void> getData({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    emit(Loading());

    try {
      QuerySnapshot querySnapshot = await collectionRef.get();

      final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
      print(allData);

      Map<String, dynamic>? firstItem =
          allData.elementAt(0) as Map<String, dynamic>?;
      Map<String, dynamic>? secondItem =
          allData.elementAt(1) as Map<String, dynamic>?;
      Map<String, dynamic>? thirdItem =
          allData.elementAt(2) as Map<String, dynamic>?;
// first email and password
      final String firstEmail = firstItem!['email'];
      final String firstPassword = firstItem['password'];

// second email and password
      final String secondEmail = secondItem!['email'];
      final String secondPassword = secondItem['password'];

// second email and password
      final String thirdEmail = thirdItem!['email'];
      final String thirdPassword = thirdItem['password'];

      if (email == firstEmail && password == firstPassword ||
          email == secondEmail && password == secondPassword ||
          email == thirdEmail && password == thirdPassword) {
        submitted(email: email, password: password);
        // Navigator.pushNamedAndRemoveUntil(
        //     context, adminMainScreen, (route) => false);

      }
    } catch (error) {
      emit(ErrorMsg(errorMsg: error.toString()));
      showSnackBar(context, message: error.toString(), error: true);
    }
  }

  void submitted({
    required String email,
    required String password,
  }) {
    emit(Loading());

    if (email != null) {
      print('submitted');

      this.email = email;
      this.password = password;
      emit(AdminSubmitted());
    }
  }

// void failedGetData(FirebaseFirestore error) {
//   print('verificationFailed : ${error.toString()}');
//   emit(ErrorMsg(errorMag: error.toString()));
// }

}
