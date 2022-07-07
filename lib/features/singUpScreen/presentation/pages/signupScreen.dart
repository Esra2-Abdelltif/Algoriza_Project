import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_algoriza/features/login_screen/presentation/pages/loginScreen.dart';
import 'package:flutter_project_algoriza/features/singUpScreen/presentation/widget/SignUpWidget.dart';
import 'package:flutter_project_algoriza/core/util/widgets/customButton.dart';
import 'package:flutter_project_algoriza/core/util/widgets/custromTextForm.dart';
import 'package:flutter_project_algoriza/core/util/constant/constant.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SignUpWidget());
  }
}
