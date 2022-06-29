import 'package:flutter/material.dart';
import 'package:flutter_project_algoriza/shared/style/colors.dart';

// const bgcolor=Colors.grey[500];
//-----------------MyDivider---------------------
class MyDivider extends StatelessWidget {
  final double height;
  final Color bgColor;
   const MyDivider({Key? key,this.height=1.5, this.bgColor=const Color(0xFF8D8E98)}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Divider(
      color: bgColor,
      height:height ,
    );
  }
}

//-----------------TextButton---------------------
class CustomTextButton extends StatelessWidget {
  final String text;
 final VoidCallback onPressed;
 final Color textcolor;

  const CustomTextButton({Key? key,required this.text,required this.onPressed,this.textcolor=defultColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextButton(onPressed: onPressed, child: Text(text,style:TextStyle(color: textcolor ) ,));
  }
}
