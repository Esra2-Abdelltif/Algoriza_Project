import 'package:flutter/material.dart';

Widget defultTextButton({required String text ,required VoidCallback onPressed})=> TextButton(onPressed: onPressed, child: Text(text,style:TextStyle(color: Colors.blue) ,));