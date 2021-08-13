import 'package:flutter_app/ui/helpers/helpers.dart';

enum UIError {
  requiredField,
  invalidField,
  invalidCredentials,
  unexpected,
}

extension UIErrorExtension on UIError {
  String get description {
    switch (this) {
      case UIError.requiredField:
        return R.strings.msgRequiredField;
      case UIError.invalidField:
        return R.strings.msgInvalidField;
      case UIError.invalidCredentials:
        return R.strings.msgInvalidCredentials;
      default:
        return R.strings.msgUnexpectedError;
    }
  }
}