import '../../../../presentation/protocols/protocols.dart';
import '../../../../validation/protocols/protocols.dart';
import '../../../builders/builders.dart';
import '../../../composites/composites.dart';

Validation makeProfileValidation() =>
    ValidationComposite(validations: makeProfileValidations());
List<FieldValidation> makeProfileValidations() => [
      ...ValidationBuilder.field('image').required().build(),
    ];
