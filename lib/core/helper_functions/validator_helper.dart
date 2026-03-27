class ValidatorHelper {
  /// Validate Name
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }
    if (value.trim().length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  /// Validate Phone (required)
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (!RegExp(r'^[0-9]{11}$').hasMatch(value)) {
      return 'Phone number must be exactly 11 digits';
    }
    return null;
  }

  /// Validate Phone (optional)
  static String? validatePhoneOptional(String? value) {
    final trimmedValue = value?.trim();
    if (trimmedValue == null || trimmedValue.isEmpty) return null;
    if (!RegExp(r'^[0-9]{11}$').hasMatch(trimmedValue)) {
      return 'Phone number must be exactly 11 digits';
    }
    return null;
  }

  /// Validate Email
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final bool emailValid = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(value);
    return emailValid ? null : 'Enter a valid email address';
  }

  /// Validate Password (registration)
  static String? validateRegisterPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    return null;
  }

  /// Validate Password (login)
  static String? validateLoginPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  /// Validate Confirm Password
  static String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Please confirm your password';
    }
    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  /// Validate Address
  static String? validateAddress(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Address is required';
    }
    if (value.trim().length < 3) {
      return 'Address must be at least 3 characters';
    }
    return null;
  }

  /// Validate OTP (6 digits)
  static String? validateOtp(String? value) {
    if (value == null || value.isEmpty) {
      return 'OTP is required';
    }
    if (!RegExp(r'^[0-9]{6}$').hasMatch(value)) {
      return 'OTP must be 6 digits';
    }
    return null;
  }

  /// Validate Pin Code (4 digits)
  static String? validatePinCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Pin code is required';
    }
    if (!RegExp(r'^[0-9]{4}$').hasMatch(value)) {
      return 'Pin code must be 4 digits';
    }
    return null;
  }
}