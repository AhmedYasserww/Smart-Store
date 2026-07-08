import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_store/core/utils/app_dimensions.dart';
import 'package:smart_store/core/utils/app_images.dart';
import 'package:smart_store/core/utils/app_style.dart';
import 'package:smart_store/features/auth/presentation/views/widgets/log_in_widgets/custom_email_text_field.dart';
import 'package:smart_store/features/auth/presentation/views/widgets/register_widgets/custom_name_text_field.dart';
import 'package:smart_store/features/auth/presentation/views/widgets/register_widgets/custom_phone_number_text_field.dart';
import 'package:smart_store/features/more/profile/presentation/manager/get_profile_cubit/get_profile_cubit.dart';
import 'package:smart_store/features/more/profile/presentation/manager/update_profile_cubit/update_profile_cubit.dart';
import 'edit_profile_view_widgets/custom_profile_action_button.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  File? _profileImage;
  String? _existingImageUrl;

  String _initials(String fullName) {
    final parts = fullName.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return fullName.length >= 2
        ? fullName.substring(0, 2).toUpperCase()
        : fullName.toUpperCase();
  }

  @override
  void initState() {
    super.initState();
    final state = context.read<GetProfileCubit>().state;
    if (state is GetProfileSuccess) {
      _nameController.text = state.profile.fullName;
      _emailController.text = state.profile.email;
      _phoneController.text = state.profile.phoneNumber;
      _existingImageUrl = state.profile.profileImageUrl;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );
    if (picked != null) {
      setState(() => _profileImage = File(picked.path));
    }
  }

  void _onSave() {
    if (_formKey.currentState!.validate()) {
      final state = context.read<GetProfileCubit>().state;
      final currentProfile =
      state is GetProfileSuccess ? state.profile : null;

      context.read<UpdateProfileCubit>().updateProfile(
        fullName: _nameController.text.trim().isEmpty
            ? (currentProfile?.fullName ?? '')
            : _nameController.text.trim(),
        email: _emailController.text.trim().isEmpty
            ? (currentProfile?.email ?? '')
            : _emailController.text.trim(),
        phoneNumber: _phoneController.text.trim().isEmpty
            ? (currentProfile?.phoneNumber ?? '')
            : _phoneController.text.trim(),
        profileImage: _profileImage,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        if (state is UpdateProfileSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context);
        }
        if (state is UpdateProfileFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.homeScreenPadding,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),

                // ✅ Profile Image
                Center(
                  child: Stack(
                    children: [
                      Container(
                        height: 88,
                        width: 88,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: _profileImage != null
                            ? ClipOval(
                          child: Image.file(
                            _profileImage!,
                            fit: BoxFit.cover,
                            width: 88,
                            height: 88,
                          ),
                        )
                            : _existingImageUrl != null
                            ? ClipOval(
                          child: Image.network(
                            _existingImageUrl!,
                            fit: BoxFit.cover,
                            width: 88,
                            height: 88,
                          ),
                        )
                            : Stack(
                          children: [
                            SvgPicture.asset(
                              AppImages.circleAvatar,
                              width: 88,
                              height: 88,
                            ),
                            Positioned.fill(
                              child: Center(
                                child: Text(
                                  _initials(_nameController.text.isEmpty
                                      ? 'User'
                                      : _nameController.text),
                                  style: AppStyle.styleBold32
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // ✅ Camera icon
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: _pickImage,
                          child: SvgPicture.asset(AppImages.lightCamera),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),
                Center(
                  child: Text(
                    "Change profile photo",
                    style: AppStyle.styleGreyRegular14,
                  ),
                ),
                const SizedBox(height: 32),

                // ✅ Full Name
                Text('Full Name', style: AppStyle.styleRegular14),
                const SizedBox(height: 8),
                NameField(nameController: _nameController),
                const SizedBox(height: 24),

                // ✅ Email
                Text('Email', style: AppStyle.styleRegular14),
                const SizedBox(height: 8),
                EmailField(emailController: _emailController),
                const SizedBox(height: 24),

                // ✅ Phone
                Text('Phone Number', style: AppStyle.styleRegular14),
                const SizedBox(height: 8),
                PhoneNumberField(phoneNumberController: _phoneController),
                const SizedBox(height: 32),

                // ✅ Buttons
                BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                  builder: (context, state) {
                    return CustomProfileActionButtons(
                      isSaveChangeLoading: state is UpdateProfileLoading,
                      onDeleteTap: () => Navigator.pop(context),
                      onSaveTap: _onSave,
                    );
                  },
                ),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}