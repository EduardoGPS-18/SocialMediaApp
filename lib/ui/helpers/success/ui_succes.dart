import '../helpers.dart';

enum UISuccess { successOnOperation }

extension UISuccessExtension on UISuccess {
  String get description {
    switch (this) {
      case UISuccess.successOnOperation:
        return R.string.successOnOperation;
    }
  }
}
