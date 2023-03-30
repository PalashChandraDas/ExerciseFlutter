import 'package:exercise_flutter/utils/di.dart';
import 'package:exercise_flutter/views/firebase_data.dart';
import 'package:exercise_flutter/views/home_screen.dart';
import 'package:exercise_flutter/views/practice_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "exercise_flutter",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        iconTheme: const IconThemeData(color: Colors.green),
      ),
      initialBinding: MyDI(),
      getPages: [
        GetPage(
          name: '/',
          page: () => PracticeScreen(),
        ),
        GetPage(
          name: HomeScreen.routeName,
          page: () => const FirebaseData(),
        )
      ],
    );
  }
}
