import 'package:meals_on_wheels/utils/english_text.dart';

class InputValidationService {
  static String? Function(String?)? getNameValidator() {
    final validName = RegExp(r'^[a-zA-Z ]+$');
    return (name) {
      String validationResults;
      if (name!.isNotEmpty) {
        if (validName.hasMatch(name)) {
          return null;
        }
        validationResults = EnglishText.canOnlyUseAlphabets;
        return validationResults;
      } else {
        validationResults = EnglishText.fieldCantBeEmpty;
      }
      return validationResults;
    };
  }

  static String? Function(String?)? getEmailValidator() {
    final validEmail = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return (email) {
      String validationResults;
      if (email!.isNotEmpty) {
        if (validEmail.hasMatch(email)) {
          return null;
        }
        validationResults = EnglishText.enterValidEmail;
        return validationResults;
      } else {
        validationResults = EnglishText.fieldCantBeEmpty;
      }
      return validationResults;
    };
  }

  static String? Function(String?)? getRequiredValidator() {
    return (text) {
      String validationResults;
      if (text!.isEmpty) {
        validationResults = EnglishText.fieldCantBeEmpty;
        return validationResults;
      }
      return null;
    };
  }
}
