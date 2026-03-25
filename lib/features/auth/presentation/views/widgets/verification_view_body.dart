import 'package:flutter/material.dart';
import 'package:smart_store/features/auth/presentation/views/widgets/verification_code_widgets/verification_footer_section.dart';
import 'package:smart_store/features/auth/presentation/views/widgets/verification_code_widgets/verification_form_widget.dart';
import 'package:smart_store/features/auth/presentation/views/widgets/verification_code_widgets/verification_header_section.dart';
import '../../../../../core/constants/verify_otp_enum.dart';
import '../../../../../core/utils/app_dimensions.dart';


class VerificationViewBody extends StatelessWidget {
  const VerificationViewBody({super.key, required this.userId, required this.type});
  final String userId;
  final OtpType type;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.authScreenPadding,
          ),
          child: SafeArea(
            child: Column(
              children:  [
                SizedBox(height: 32),
                
                VerificationHeaderSection(),
                
                SizedBox(height: 32),
                
                VerificationForm(
                  type:type,
                  userId:userId ,
                ),
                
                SizedBox(height: 24),
                
                VerificationFooterSection(),
                
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}