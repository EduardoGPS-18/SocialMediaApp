import '../../../../presentation/protocols/protocols.dart';
import '../../../../validation/protocols/protocols.dart';
import '../../../builders/builders.dart';
import '../../../composites/composites.dart';

Validation makeAuthValidation() => ValidationComposite(validations: makeAuthValidations());
List<FieldValidation> makeAuthValidations() => [
      ...ValidationBuilder.field('email').notNullable().required().email().build(),
      ...ValidationBuilder.field('password').notNullable().required().min(8).build(),
      ...ValidationBuilder.field('confirm_password').notNullable().required().min(8).sameAs('password').build(),
      ...ValidationBuilder.field('image').notNullable().required().build(),
      ...ValidationBuilder.field('name').notNullable().required().min(8).build(),
    ];
