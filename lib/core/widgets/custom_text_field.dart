import 'package:flutter/material.dart';

import '../utils/app_color.dart';
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.onSaved,this.onChange,
    this.validator, this.prefixIcon,this.suffixIcon,
    this.obscureText =false,
    this.controller,
    this.hintText,
    this.keyboardType,
  });


  final void Function(String?)? onSaved;
  final void Function(String?)? onChange;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final bool obscureText ;
  final TextEditingController? controller;
  final String? hintText ;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {

    return TextFormField(

      //  style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400),
        keyboardType: keyboardType,
        controller: controller ,
        obscureText:obscureText,
        onSaved:onSaved ,
        onChanged: onChange,
        validator: validator,
        decoration:InputDecoration(
          filled: true,
            fillColor: Color(0xffF9FAFA),
            prefixIcon:Icon(prefixIcon,color: AppColors.primaryTextColor,size: 30,) ,
            prefixIconColor: AppColors.primaryTextColor,
            hintText:hintText ,

            suffixIcon: suffixIcon ,

            hintStyle: const  TextStyle(
              color: AppColors.greyTextColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder(),
            errorBorder: buildBorder(Colors.red),
            focusedErrorBorder: buildBorder(Colors.red),
            border:  buildBorder()

        )
    );

  }
  OutlineInputBorder buildBorder([color]){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ??  AppColors.primaryColor,width: 1),
    );
  }
}

