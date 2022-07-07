import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_algoriza/core/util/style/colors.dart';
import 'package:flutter_project_algoriza/core/util/constant/constant.dart';

import 'CustomTextButton.dart';

class CustomRowText extends StatelessWidget {
  final String Text1;
  final String Text2;
  final Color textcolor;
  final VoidCallback onPressed;


  const CustomRowText({Key? key,required this.Text1,required this.Text2,required this.onPressed,this.textcolor=defultColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(Text1,style:TextStyle(fontWeight: FontWeight.w600,)),
        CustomTextButton(text: Text2,textcolor: textcolor, onPressed:onPressed,),

      ],
    );
  }
}
