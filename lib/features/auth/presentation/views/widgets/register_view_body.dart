import 'package:flutter/material.dart';
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
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: const [

                RegisterHeaderSection(),

                SizedBox(height: 32),

                RegisterForm(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}