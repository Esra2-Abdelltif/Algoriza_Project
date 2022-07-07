import 'package:flutter/material.dart';
import 'package:flutter_project_algoriza/features/onboarding_screen/presentation/pages/onboarding_screen.dart';
import 'package:flutter_project_algoriza/core/util/style/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
       theme: lightthemes,
      home: const OnBoardingScreen(),
    );
  }
}

