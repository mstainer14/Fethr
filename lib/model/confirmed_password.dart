import 'package:formz/formz.dart';

enum ConfirmedPasswordValidationError { invalid, none }

class ConfirmedPassword extends FormzInput<String, ConfirmedPasswordValidationError> {
  final originalPassword;

  const ConfirmedPassword.pure() : originalPassword = '', super.pure('');
  const ConfirmedPassword.dirty({String password, String value = ''}) : originalPassword = password, super.dirty(value);

  @override
  ConfirmedPasswordValidationError validator(String value) {
    print(originalPassword);
    print('PASSWORD VALUE: $value');
    if (originalPassword == '') {
      return ConfirmedPasswordValidationError.none;
    }
    return originalPassword == value ? null : ConfirmedPasswordValidationError.invalid;
  }
}