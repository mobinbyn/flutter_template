// Todo: The template value
mixin ValidatorMixin {
  //phoneNumber validation
  String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(r'^\+?1?\d{10,15}$').hasMatch(phoneNumber)) {
      return 'Please enter a valid phoneNumber';
    }
    return null;
  }

  // Email validation
  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(email)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  // Password validation
  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    } else if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  // Confirm password validation
  String? validateConfirmPassword(String? confirmPassword, String password) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Confirm password is required';
    } else if (confirmPassword != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  // Username validation
  String? validateUsername(String? username) {
    if (username == null || username.isEmpty) {
      return 'Username is required';
    } else if (username.length < 3 || username.length > 20) {
      return 'Username must be between 3 and 20 characters';
    }
    return null;
  }

  // Name validation
  String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Name is required';
    }
    return null;
  }
}
