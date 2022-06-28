import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation/business_logic/cubit/admin_login_auth/admin_login_auth_cubit.dart';
import 'package:reservation/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:reservation/constants/my_routes.dart';
import 'package:reservation/presentation/screens/admin/adminAuth/admin_login_screen.dart';
import 'package:reservation/presentation/screens/admin/admin_main_screen.dart';
import 'package:reservation/presentation/screens/admin/admin_splash_screen.dart';
import 'package:reservation/presentation/screens/admin/reservation/reservation_product_details.dart';
import 'package:reservation/presentation/screens/home/confirm_appointment_screen.dart';
import 'package:reservation/presentation/screens/home/date_screen.dart';
import 'package:reservation/presentation/screens/home/product_details.dart';
import 'package:reservation/presentation/screens/main_screen.dart';
import 'package:reservation/presentation/screens/reservation/order_details.dart';
import 'package:reservation/presentation/screens/reservation/order_return.dart';
import 'package:reservation/presentation/screens/splash_screen.dart';
import 'package:reservation/presentation/screens/userAuth/otp_screen.dart';
import 'package:reservation/presentation/screens/userAuth/confirm_success.dart';
import 'package:reservation/presentation/screens/userAuth/login_screen.dart';
import 'package:reservation/presentation/screens/userAuth/register_account_details.dart';
import 'package:reservation/presentation/screens/userAuth/register_screen.dart';
import 'package:reservation/presentation/screens/userAuth/user_login_screen.dart';
import 'package:reservation/presentation/screens/welcome_screen.dart';

class AppRouter {
  PhoneAuthCubit? phoneAuthCubit;
  AdminLoginAuthCubit? adminLoginAuthCubit;

  AppRouter() {
    phoneAuthCubit = PhoneAuthCubit();
    adminLoginAuthCubit = AdminLoginAuthCubit();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case welcomeScreen:
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
        );
      case userLoginScreen:
        return MaterialPageRoute(
          builder: (_) => const UserLoginScreen(),
        );
      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case registerScreen:
        return MaterialPageRoute(
          builder: (_) => RegisterScreen(),
        );
      case registerAccountDetails:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PhoneAuthCubit>.value(
            value: phoneAuthCubit!,
            child: RegisterAccountDetails(),
          ),
        );
      case otpScreen:
        final phoneNumber = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PhoneAuthCubit>.value(
            value: phoneAuthCubit!,
            child: OtpScreen(phoneNumber: phoneNumber),
          ),
        );
      case confirmSuccess:
        return MaterialPageRoute(
          builder: (_) => const ConfirmSuccess(),
        );
      case mainScreen:
        return MaterialPageRoute(
          builder: (_) => const MainScreen(),
        );
      case productDetails:
        late DocumentSnapshot? myData =
            settings.arguments as DocumentSnapshot<Object?>?;
        return MaterialPageRoute(
          builder: (_) => ProductDetails(myData: myData!),
        );
      case dateScreen:
        return MaterialPageRoute(
          builder: (_) => const DateScreen(),
        );
      case confirmAppointmentScreen:
        return MaterialPageRoute(
          builder: (_) => const ConfirmAppointmentScreen(),
        );
      case orderDetails:
        late DocumentSnapshot? myData =
            settings.arguments as DocumentSnapshot<Object?>?;

        return MaterialPageRoute(
          builder: (_) => OrderDetails(myData: myData!),
        );
      case orderReturn:
        late DocumentSnapshot? myData =
            settings.arguments as DocumentSnapshot<Object?>?;
        return MaterialPageRoute(
          builder: (_) => OrderReturn(myData: myData!),
        );
      case adminSplashScreen:
        return MaterialPageRoute(
          builder: (_) => const AdminSplashScreen(),
        );
      case adminLoginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AdminLoginAuthCubit>(
            create: (context) => AdminLoginAuthCubit(),
            child: const AdminLoginScreen(),
          ),
        );
      case adminMainScreen:
        late DocumentSnapshot? myData =
            settings.arguments as DocumentSnapshot<Object?>?;
        settings = settings;
        return MaterialPageRoute(
          builder: (_) => AdminMainScreen(myData: myData),
        );
      case reservationProductDetails:
        late DocumentSnapshot? myData =
            settings.arguments as DocumentSnapshot<Object?>?;
        return MaterialPageRoute(
          builder: (_) => ReservationProductDetails(myData: myData!),
        );
    }
    return null;
  }
}
