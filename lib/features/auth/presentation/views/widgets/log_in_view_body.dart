import 'package:flutter/material.dart';
import 'package:smart_store/core/utils/app_dimensions.dart';
import 'log_in_widgets/log_in_footer_section.dart';
import 'log_in_widgets/log_in_form.dart';
import 'log_in_widgets/log_in_header_section.dart';

class LogInViewBody extends StatelessWidget {
  const LogInViewBody({super.key});

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

                LoginHeaderSection(),

                SizedBox(height: 32),

                LoginForm(),

                SizedBox(height: 16),

                LoginFooterSection(),

                SizedBox(height: 16),

              ],
            ),
          ),
        ),
      ),
    );
  }
}