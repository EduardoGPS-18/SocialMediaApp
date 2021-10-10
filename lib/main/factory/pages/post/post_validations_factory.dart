import '../../../../presentation/protocols/protocols.dart';
import '../../../../validation/validation.dart';
import '../../../builders/builders.dart';
import '../../../composites/composites.dart';

Validation makePostValidation() => ValidationComposite(validations: _makePostValidations());

List<FieldValidation> _makePostValidations() => [
      ...ValidationBuilder.field('comment_content').min(3).build(),
    ];
