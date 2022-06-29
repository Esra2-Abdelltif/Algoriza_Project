import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_algoriza/shared/style/colors.dart';

class  CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final String FieldName;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType textInputType;
  final bool isPass ;
  final bool isphone;
  final bool secirty ;
  CustomTextField({
  Key? key,
    this.prefixIcon=null,
    this.labelText=null,
    required this.FieldName,
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
      Text(FieldName,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),),
      const SizedBox(
        height: 5,
      ),
      TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          hintText:hintText,focusColor: Colors.blue,
          hintStyle:TextStyle(fontSize: 16, ),
         // filled: true,
         // fillColor: Color(0xff25282C),
          hoverColor: Colors.blue,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color:Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.grey, width: 2,),
          ),
          suffixIcon: isPass ? suffixIcon: null,
          prefixIcon: isphone ?  Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: CountryCodePicker(
              onChanged: print,
              showDropDownButton: true,
              initialSelection: '+81',
              favorite: ['+81','EG'],
              showFlagMain: false,
              showOnlyCountryWhenClosed: false,
            ),
          ) : prefixIcon,
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


