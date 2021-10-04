import 'package:equatable/equatable.dart';

import '../../presentation/protocols/protocols.dart';

class NotNullableValidation extends Equatable implements Validation {
  final String? field;

  const NotNullableValidation({
    this.field,
  });

  @override
  List<Object?> get props => [field];

  @override
  ValidationError validate({required String field, required Map input}) {
    return field == null ? ValidationError.invalidField : ValidationError.noError;
  }
}
