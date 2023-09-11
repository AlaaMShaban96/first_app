// ignore_for_file: prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/screens/auth/login_screen.dart';
import 'screens/main_screen.dart';
import 'screens/auth/login_screen.dart';


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

   const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: "test",
      theme: ThemeData(primaryColor: Colors.amberAccent),
      home: LoginScreen(),
      // home: OnboardingPage(pages: pages),
      // home: MainScreen(),
      // home: Home(location: location),
    );
  }
}


