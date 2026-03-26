import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/core/utils/app_color.dart';
import '../../../../../../core/constants/verify_otp_enum.dart';
import '../../../../../../core/helper_functions/save_user_data.dart';
import '../../../manager/resend_otp_cubit/resend_otp_cubit.dart';

class VerificationFooterSection extends StatefulWidget {
  final OtpType type;

  const VerificationFooterSection({super.key, required this.type});

  @override
  State<VerificationFooterSection> createState() =>
      _VerificationFooterSectionState();
}

class _VerificationFooterSectionState
    extends State<VerificationFooterSection> {
  int seconds = 0;
  Timer? timer;
  bool isSuccess = false;

  void startTimer() {
    setState(() {
      seconds = 30;
      isSuccess = false;
    });

    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (seconds == 0) {
        t.cancel();
      } else {
        setState(() {
          seconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResendOtpCubit, ResendOtpState>(
      listener: (context, state) {
        if (state is ResendOtpSuccess) {
          startTimer();

          setState(() {
            isSuccess = true;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text(state.message),
            ),
          );
        }

        if (state is ResendOtpFailure) {
          HapticFeedback.mediumImpact(); // 📳 vibration

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.errorMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is ResendOtpLoading;

        return Column(
          children: [
            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don’t receive a code? "),

                GestureDetector(
                  onTap: (seconds > 0 || isLoading)
                      ? null
                      : () async {
                    final userId = widget.type == OtpType.register
                        ? await UserPreferences.getUserId()
                        : await UserPreferences.getTempUserId();

                    context
                        .read<ResendOtpCubit>()
                        .resendOtp(userId: userId);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: seconds > 0
                          ? Colors.grey.shade100
                          : Colors.blue.withOpacity(0.09), // 🎨 dynamic color
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: isLoading
                        ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                        : Row(
                      children: [
                        Text(
                          seconds > 0
                              ? "Resend in $seconds s"
                              : "Resend Code",
                          style: TextStyle(
                            color: seconds > 0
                                ? Colors.grey
                                : AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(width: 6),

                        // ✅ success icon
                        if (isSuccess && seconds > 0)
                          const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 18,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}