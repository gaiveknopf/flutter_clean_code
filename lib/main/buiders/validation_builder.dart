import '../../validation/protocols/protocols.dart';
import '../../validation/validators/validators.dart';

class ValidationBuilder {
  static ValidationBuilder _instance;
  String fieldName;
  List<FieldValidation> validations = [];

  ValidationBuilder._();

  static ValidationBuilder field(String fieldName) {
    _instance = ValidationBuilder._();
    _instance.fieldName = fieldName;
    return _instance;
  }

  ValidationBuilder required() {
    validations.add(RequiredFieldValidation(fieldName));
    return this;
  }

  ValidationBuilder email() {
    validations.add(EmailValidation(fieldName));
    return this;
  }

  ValidationBuilder min(int minLength) {
    validations.add(MinLengthValidation(field: fieldName, minLength: minLength));
    return this;
  }

  ValidationBuilder sameAs(String compareField) {
    validations.add(CompareFieldsValidation(field: fieldName, compareField: compareField));
    return this;
  }

  List<FieldValidation> build() => validations;
}
