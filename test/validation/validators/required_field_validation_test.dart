import 'package:test/test.dart';

import 'package:flutter_app/presentation/protocols/protocols.dart';
import 'package:flutter_app/validation/validators/validators.dart';

void main() {
  RequiredFieldValidation sut;

  setUp(() {
    sut = RequiredFieldValidation('any_field');
  });

  test('Should return null if values is not empty', () {
    expect(sut.validate({'any_field': 'any_value'}), null);
  });

  test('Should return error if values is empty', () {
    expect(sut.validate({'any_field': ''}), ValidationError.requiredField);
  });

  test('Should return error if values is null', () {
    expect(sut.validate({'any_field': null}), ValidationError.requiredField);
  });
}
