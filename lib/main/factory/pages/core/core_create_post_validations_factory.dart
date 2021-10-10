import '../../../../presentation/protocols/protocols.dart';
import '../../../../validation/validation.dart';
import '../../../builders/builders.dart';
import '../../../composites/validation_composite.dart';

Validation makeCreatePostValidations() => ValidationComposite(validations: _makePostValidations());
List<FieldValidation> _makePostValidations() => [
      ...ValidationBuilder.field('publish_content').min(3).build(),
    ];
