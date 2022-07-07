import 'package:flutter/material.dart';

import 'package:flutter_project_algoriza/features/onboarding_screen/presentation/widget/onboardingWidget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController =PageController();
  bool isLast=true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: OnboardingWidget()
    );
  }
}
