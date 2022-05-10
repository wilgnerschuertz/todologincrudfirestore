class Validator {
  static String? validateField({required String value}) {
    if (value.isEmpty) {
      return 'TextField cannot be empty';
    }
    return null;
  }

  static String? validatorUserId({required String uid}) {
    if (uid.isEmpty) {
      return 'User ID cannot be empty';
    } else if (uid.length <= 5) {
      return 'User ID must be at least 5 characters';
    }
    return null;
  }
}
