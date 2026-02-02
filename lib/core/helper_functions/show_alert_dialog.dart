import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/widgets/verificatin_code_widgets/success_dialog.dart';

void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => const SuccessDialog(),
  );
}