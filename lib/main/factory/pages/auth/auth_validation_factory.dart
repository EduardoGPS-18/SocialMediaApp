import '../../../../presentation/protocols/protocols.dart';
import '../../../../validation/protocols/protocols.dart';
import '../../../builders/builders.dart';
import '../../../composites/composites.dart';

Validation makeAuthValidation() => ValidationComposite(validations: makeAuthValidations());
List<FieldValidation> makeAuthValidations() => [
      ...ValidationBuilder.field('email').required().email().build(),
      ...ValidationBuilder.field('password').required().min(8).build(),
      ...ValidationBuilder.field('confirm_password').required().min(8).sameAs('password').build(),
      ...ValidationBuilder.field('image').required().build(),
      ...ValidationBuilder.field('name').required().min(8).build(),
    ];
