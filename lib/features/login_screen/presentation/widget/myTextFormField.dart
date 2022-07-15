import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_algoriza/core/util/style/colors.dart';

class  MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelText;

  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType textInputType;
  final bool isPass ;
  final bool isphone;
  final bool secirty ;
  MyTextField({
    Key? key,
    this.prefixIcon=null,
    this.labelText=null,

    required this.controller,
    required this.hintText,

    this.suffixIcon=null,
    required this.textInputType,
    this.isPass=false,
    this.isphone=false,this.secirty=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: labelText,
            hintText:hintText,focusColor: Colors.blue,
            hintStyle:TextStyle(fontSize: 16, ),

            hoverColor: Colors.blue,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color:Colors.blue),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.grey, width: 2,),
            ),
            suffixIcon:suffixIcon,
            prefixIcon: prefixIcon,
          ),
          obscureText: secirty,
          controller: controller,
          keyboardType:textInputType,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        )
      ],);
  }
}


