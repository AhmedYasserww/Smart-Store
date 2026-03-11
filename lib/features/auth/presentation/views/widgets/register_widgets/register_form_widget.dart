import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../../../../core/widgets/custom_button.dart';


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

    return BlocConsumer<RegisterCubit, RegisterState>(

      listener: (context, state) {

        if (state is RegisterSuccess) {

          /// navigate
        }

        if (state is RegisterFailure) {

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
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
                text: state is RegisterLoading
                    ? "Loading..."
                    : "Sign Up",
                onTap: () {

                  if (formKey.currentState!.validate()) {

                    context.read<RegisterCubit>().register(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      phone: phoneController.text,
                      address: addressController.text,
                    );

                  } else {

                    autoValidate.value =
                        AutovalidateMode.always;

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