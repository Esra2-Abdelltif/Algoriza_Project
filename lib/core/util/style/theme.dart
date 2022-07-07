import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project_algoriza/core/util/style/colors.dart';


ThemeData lightthemes = ThemeData(
  primaryColor: defultColor,
    primarySwatch: defultColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      titleSpacing: 15,
      iconTheme: IconThemeData(color: Colors.black),
//backwardsCompatibility: true,
      backgroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        color:Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
//fontStyle: FontStyle.italic
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness:Brightness.dark,
// statusBarBrightness: Brightness.dark,

      ),
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: Colors.black),
      bodyText2:  TextStyle(fontSize: 16, color: Colors.black),
      headline1:TextStyle(fontSize: 30, color: Colors.black54, fontWeight: FontWeight.w600,),
      headline2: TextStyle(fontWeight: FontWeight.w300,color: Color(0xFF8D8E98)),

    ),

);