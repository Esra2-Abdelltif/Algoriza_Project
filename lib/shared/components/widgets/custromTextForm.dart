import 'package:flutter/material.dart';
import 'package:flutter_project_algoriza/shared/style/colors.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class  CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String FieldName;
  final Widget suffixIcon;
 // final Icon prefixIcon;
  final TextInputType textInputType;
  final bool isPass ;
  final bool isphone;
  final bool secirty ;
  CustomTextField({
  Key? key,
    required this.FieldName,
  required this.controller,
  required this.hintText,
   this.suffixIcon=const Icon( Icons.lock,color: Colors.black),
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
          // labelText: 'Pass',
          hintText:hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: defultColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.grey, width: 2,),
          ),
          suffixIcon: isPass ? suffixIcon: SizedBox.shrink(),
          prefixIcon: isphone ?  Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: InternationalPhoneNumberInput(
              initialValue: PhoneNumber(
                isoCode: PhoneNumber.getISO2CodeByPrefix('+81'),
              ),
              keyboardType: TextInputType.phone,
              onInputChanged: (PhoneNumber number) {},
              selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.DROPDOWN,
                showFlags: true,
                trailingSpace:false,
                useEmoji: true,
              ),
              ignoreBlank: false,
              autoValidateMode: AutovalidateMode.disabled,
               selectorTextStyle: TextStyle(color: Colors.black),
              textFieldController: controller,
              formatInput: true,
              inputDecoration: InputDecoration.collapsed(
                fillColor: Colors.black,
                hintText: 'Eg. 812345678',

              ),

            ),
          ): null,
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



class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final Function()? onTap;
  final String? Function(String?)? validate;
  final String? placeHolder;
  final double? verticalPadding;
  final Icon? suffixIcon;
  final Function()? suffixIconPressed;
  final bool isPassword;
  final String label;

  CustomTextFormField({
    Key? key,
    required this.controller,
    required this.validate,
    required this.label,
    this.type,
    this.placeHolder,
    this.onTap,
    this.verticalPadding,
    this.suffixIcon,
    this.suffixIconPressed,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding ?? 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: controller,
            keyboardType: type,
            obscureText: isPassword,
            validator: validate,
            onTap: onTap,
            decoration: InputDecoration(
              hintText: placeHolder,
              hintStyle: TextStyle(color: Colors.grey),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.grey),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.grey),
              ),
              filled: true,
              fillColor:defultColor,
              suffixIcon: suffixIcon == null
                  ? null
                  : InkWell(
                onTap: suffixIconPressed,
                child: suffixIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

