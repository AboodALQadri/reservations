import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:reservation/app_router/app_router.dart';
import 'package:reservation/constants/my_routes.dart';

late String initialRoute;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
    (_) => {runApp(MyApp(appRouter: AppRouter()))},
  );

  FirebaseAuth.instance.authStateChanges().listen((user) {
    if (user == null) {
      initialRoute = splashScreen;
    } else {
      initialRoute = mainScreen;
    }
  });
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({
    super.key,
    required this.appRouter,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      onGenerateRoute: appRouter.generateRoute,
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
    );
  }
}
