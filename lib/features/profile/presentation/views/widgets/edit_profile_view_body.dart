import 'package:flutter/material.dart';
import 'package:smart_store/core/widgets/custom_text_field.dart';

import '../../../../../core/utils/app_style.dart';
class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: const Column(
        children: [
          SizedBox(height: 32),
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.red,
          ),
          SizedBox(height: 16,),
          Text("Change profile photo", style: AppStyle.styleGreyRegular14,),
          SizedBox(height: 32,),
          Text("Full Name",style:  AppStyle.styleRegular14,),
          SizedBox(height: 8,),
          CustomTextField(
            hintText: "Ahmed yasser xx",
          ),

          
        ],
      ),
    );
  }
}
