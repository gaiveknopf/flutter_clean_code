import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../presentation/protocols/protocols.dart';
import '../../validation/protocols/protocols.dart';

class CompareFieldsValidation extends Equatable implements FieldValidation {
  final String field;
  final String compareField;

  List get props => [field, compareField];

  CompareFieldsValidation({@required this.field, @required this.compareField});

  ValidationError validate(Map input) =>
      input[field] != null && input[compareField] != null && input[field] != input[compareField]
          ? ValidationError.invalidField
          : null;
}
