import 'package:faker/faker.dart';
import 'package:test/test.dart';

import 'package:flutter_app/presentation/protocols/protocols.dart';
import 'package:flutter_app/validation/validators/validators.dart';

void main() {
  MinLengthValidation sut;

  setUp(() {
    sut = MinLengthValidation(field: 'any_field', minLength: 5);
  });

  test('Should return error if value is empty', () async {
    expect(sut.validate({'any_field': ''}), ValidationError.invalidField);
  });

  test('Should return error if value is null', () async {
    expect(sut.validate({'any_field': null}), ValidationError.invalidField);
  });

  test('Should return error if value is less than min length', () async {
    expect(sut.validate({'any_field': faker.randomGenerator.string(4, min: 1)}),
        ValidationError.invalidField);
  });

  test('Should return error if value is bigger than min length', () async {
    expect(sut.validate({'any_field': faker.randomGenerator.string(6, min: 6)}), null);
  });
}
