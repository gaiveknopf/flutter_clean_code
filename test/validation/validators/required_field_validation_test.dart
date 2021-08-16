import 'package:test/test.dart';

import 'package:flutter_app/presentation/protocols/protocols.dart';
import 'package:flutter_app/validation/validators/validators.dart';

void main() {
  late RequiredFieldValidation sut;

  setUp(() {
    sut = RequiredFieldValidation('any_field');
  });

  test('Should return null if values is not empty', () {
    expect(sut.validate('any_value'), null);
  });

  test('Should return error if values is empty', () {
    expect(sut.validate(''), ValidationError.requiredField);
  });

  test('Should return error if values is null', () {
    expect(sut.validate(null), ValidationError.requiredField);
  });
}
