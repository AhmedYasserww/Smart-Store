import 'package:flutter/material.dart';
import 'package:smart_store/features/auth/presentation/views/widgets/verification_code_widgets/verification_footer_section.dart';
import 'package:smart_store/features/auth/presentation/views/widgets/verification_code_widgets/verification_form_widget.dart';
import 'package:smart_store/features/auth/presentation/views/widgets/verification_code_widgets/verification_header_section.dart';
import '../../../../../core/utils/app_dimensions.dart';


class VerificationViewBody extends StatelessWidget {
  const VerificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.authScreenPadding,
            ),
            child: Column(
              children: const [
                SizedBox(height: 32),

                VerificationHeaderSection(),

                SizedBox(height: 32),

                VerificationForm(),

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