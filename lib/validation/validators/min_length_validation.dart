import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../presentation/protocols/protocols.dart';
import '../../validation/protocols/protocols.dart';

class MinLengthValidation extends Equatable implements FieldValidation {
  final String field;
  final int minLength;

  List get props => [field, minLength];

  MinLengthValidation({@required this.field, @required this.minLength});

  ValidationError validate(Map input) {
    return input[field] != null && input[field].length >= minLength
        ? null
        : ValidationError.invalidField;
  }
}
