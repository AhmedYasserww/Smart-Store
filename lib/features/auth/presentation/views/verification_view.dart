import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/features/auth/presentation/views/widgets/verification_view_body.dart';
import '../../../../core/constants/verify_otp_enum.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../data/repos/auth_repo_imp.dart';
import '../manager/verification_otp_cubit/verify_otp_cubit.dart';

class VerificationView extends StatelessWidget {
  final String userId;
  final OtpType type;
  const VerificationView({super.key, required this.userId, required this.type});

  static const String routeName = 'verification_view';

  @override Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VerifyOtpCubit(getIt.get<AuthRepoImpl>()), child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, elevation: 0, leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new),),),
      body: VerificationViewBody(
        type: type,
        userId: userId,
      ),
    ),
    );
  }
}