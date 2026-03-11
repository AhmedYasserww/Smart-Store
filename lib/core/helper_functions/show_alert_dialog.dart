import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/widgets/verification_code_widgets/success_dialog.dart';


void showSuccessDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) =>  SuccessDialog(
      message:message,
    ),
  );
}