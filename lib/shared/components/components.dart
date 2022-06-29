import 'package:flutter/material.dart';
import 'package:flutter_project_algoriza/shared/style/colors.dart';

Widget defultTextButton({required String text ,required VoidCallback onPressed,Color textcolor =defultColor})=> TextButton(onPressed: onPressed, child: Text(text,style:TextStyle(color: textcolor ) ,));