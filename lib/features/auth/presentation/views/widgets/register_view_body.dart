import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_dimensions.dart';
import 'package:smart_store/features/auth/presentation/views/widgets/register_widgets/register_footer_widget.dart';
import 'package:smart_store/features/auth/presentation/views/widgets/register_widgets/register_form_widget.dart';
import 'package:smart_store/features/auth/presentation/views/widgets/register_widgets/register_header_section.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

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

                RegisterHeaderSection(),

                SizedBox(height: 32),

                RegisterForm(),

                SizedBox(height: 16),

                RegisterFooterSection(),

                SizedBox(height: 16),

              ],
            ),
          ),
        ),
      ),
    );
  }
}