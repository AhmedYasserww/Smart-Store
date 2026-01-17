//
// import 'package:flutter/material.dart';
// import 'package:marketi_app/core/utils/app_color.dart';
// class CustomTextField extends StatelessWidget {
//    const CustomTextField({
//      super.key,
//      this.onSaved,this.onChange,
//      this.validator, this.prefixIcon,this.suffixIcon,
//      this.obscureText =false,
//      this.controller,
//     this.hintText,
//      this.keyboardType,
//      this.labelText
//    });
//
//
//    final void Function(String?)? onSaved;
//    final void Function(String?)? onChange;
//    final String? Function(String?)? validator;
//    final Widget? prefixIcon;
//   final Widget? suffixIcon;
//   final bool obscureText ;
//   final TextEditingController? controller;
//    final String? hintText ;
//    final Widget? labelText;
//    final TextInputType? keyboardType;
//   @override
//   Widget build(BuildContext context) {
//
//       return TextFormField(
// style: const TextStyle(color: AppColors.primaryColor),
//         keyboardType: keyboardType,
//         controller: controller ,
//         obscureText:obscureText,
//         onSaved:onSaved ,
//         onChanged: onChange,
//         validator: validator,
//           decoration:InputDecoration(
//             label:labelText ,
//
//             prefixIcon:prefixIcon ,
//             prefixIconColor: AppColors.primaryColor,
//             hintText:hintText ,
//             suffixIcon: suffixIcon,
//
//               hintStyle: const TextStyle(fontSize: 16,
//                   fontWeight: FontWeight.w400,
//                 color:  Color(0xff929BAB)
//               ),
//       enabledBorder: buildBorder(),
//            focusedBorder: buildBorder(),
//             errorBorder: buildBorder(Colors.red),
//             focusedErrorBorder: buildBorder(Colors.red),
//             border:  buildBorder()
//
//           )
//       );
//
//   }
//    OutlineInputBorder buildBorder([color]){
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10),
//       borderSide: BorderSide(color: color ?? const    Color(0xB2B2CCFF),width: 2),
//     );
//    }
// }
//
