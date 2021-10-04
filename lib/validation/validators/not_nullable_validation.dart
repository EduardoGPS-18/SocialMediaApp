import 'package:equatable/equatable.dart';

import '../../presentation/protocols/protocols.dart';
import '../protocols/field_validation.dart';

class NotNullableValidation extends Equatable implements FieldValidation {
  @override
  final String field;

  const NotNullableValidation({
    required this.field,
  });

  @override
  List<Object?> get props => [field];

  @override
  ValidationError validate(Map input) {
    return input[field] == null ? ValidationError.invalidField : ValidationError.noError;
  }
}
