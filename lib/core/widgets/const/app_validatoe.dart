class AppValidatoe {
  static String? displayNamedValidator(String displayName) {
    if (displayName == null || displayName.isEmpty) {
      return "Disolay name contect is Empety";
    }
    if (displayName.length < 3 || displayName.length > 20) {
      return "Display name must be between 3 and  20 characters";
    }
    return null; // return null if display name is vailed
  }

  static String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter an email';
    }
    if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
        .hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return "plases enter a password ";
    }
    if (value.length < 6) {
      return "password must be at lest 6 characters long";
    }
    return null;
  }

  static String? repetPasswordValidator(
      {required String? value, required String? password}) {
    if (value == null || password == null) {
      return "Password field cannot be empty";
    }
    if (value != password) {
      return "Password does not match";
    }
    return null;
  }
}
