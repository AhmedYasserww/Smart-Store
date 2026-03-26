import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smart_store/core/helper_functions/navigation_helper.dart';
import 'package:smart_store/features/auth/presentation/views/verification_view.dart';
import 'package:smart_store/features/auth/presentation/views/widgets/register_widgets/register_fields.dart';
import '../../../../../../core/constants/verify_otp_enum.dart';
import '../../../../../../core/helper_functions/save_user_data.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../data/entities/register_entity.dart';
import '../../../manager/register_client_cubit/register_client_cubit.dart';
class RegisterForm extends HookWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {

    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final phoneController = useTextEditingController();
    final addressController = useTextEditingController();

    final passwordVisible = useState(true);
    final confirmPasswordVisible = useState(true);

    final formKey = useMemoized(() => GlobalKey<FormState>());
    final autoValidate = useState(AutovalidateMode.disabled);

    return BlocConsumer<RegisterClientCubit, RegisterClientState>(

      listener: (context, state) async {

        if (state is RegisterClientSuccess) {
          final data = state.registerModel.data!;
          await UserPreferences.saveUserData(
            id: data.id,
            fullName: data.fullName,
            email: data.email,
            phoneNumber: data.phoneNumber,
            age: data.age,
            address: data.address,
            profileImageUrl: data.profileImageUrl,
            accessToken: data.accessToken,
            refreshToken: data.refreshToken,
            role: data.role,
            isEmailConfirmed: data.isEmailConfirmed,
          );
          await UserPreferences.saveUserId(data.id);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text(state.registerModel.message),
            ),
          );

          NavigationHelper.pushWithCupertinoTransition(
            context,
            VerificationView(
              userId: data.id,
              type: OtpType.register,
            ),
          );
        }

        if (state is RegisterClientFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.errorMessage),
            ),
          );
        }
      },

      builder: (context, state) {

        return Form(
          key: formKey,
          autovalidateMode: autoValidate.value,
          child: Column(
            children: [

              RegisterFields(
                nameController: nameController,
                emailController: emailController,
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
                phoneController: phoneController,
                addressController: addressController,
                passwordVisible: passwordVisible,
                confirmPasswordVisible: confirmPasswordVisible,
              ),

              const SizedBox(height: 24),

              CustomButton(
                text: "Sign Up",
                isLoading: state is RegisterClientLoading,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    context.read<RegisterClientCubit>().registerClient(
                      RegisterEntity(
                        fullName: nameController.text,
                        confirmPassword: confirmPasswordController.text,
                        phoneNumber: phoneController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        address: addressController.text,
                      ),
                    );
                  } else {
                    autoValidate.value = AutovalidateMode.always;
                  }
                },
              ),

            ],
          ),
        );
      },
    );
  }
}