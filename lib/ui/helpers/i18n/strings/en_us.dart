import 'translation.dart';

class EnUs implements Translation {
  String get msgEmailInUseError => 'This email is already in use.';
  String get msgInvalidCredentials => 'Invalid credentials.';
  String get msgInvalidField => 'Invalid field';
  String get msgRequiredField => 'RequiredField';
  String get msgUnexpectedError => 'Something wrong happened. try again soon.';

  String get addAccount => 'Add Account';
  String get email => 'Email';
  String get enter => 'Enter';
  String get login => 'Login';
  String get name => 'Name';
  String get password => 'Password';
  String get passwordConfirmation => 'Password confirmation';
  String get wait => 'Loading...';
}
