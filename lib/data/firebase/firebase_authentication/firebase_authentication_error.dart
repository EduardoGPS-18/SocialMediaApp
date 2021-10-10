import 'package:flutter/foundation.dart';

enum FirebaseAuthenticationError {
  emailAlreadyInUse,
  internalError,
  invalidEmail,
  operationNotAllowed,
  userDisabled,
  userNotFound,
  wrongPassword,
  weakPassword,
}

extension FirebaseAuthenticationErrorExtension on FirebaseAuthenticationError {
  String get name => describeEnum(this);

  String get code {
    switch (this) {
      case FirebaseAuthenticationError.emailAlreadyInUse:
        return 'email-already-in-use';
      case FirebaseAuthenticationError.internalError:
        return 'internal-error';
      case FirebaseAuthenticationError.invalidEmail:
        return 'invalid-email';
      case FirebaseAuthenticationError.operationNotAllowed:
        return 'operation-not-allowed';
      case FirebaseAuthenticationError.userDisabled:
        return 'user-disabled';
      case FirebaseAuthenticationError.userNotFound:
        return 'user-not-found';
      case FirebaseAuthenticationError.wrongPassword:
        return 'wrong-password';
      case FirebaseAuthenticationError.weakPassword:
        return 'weak-password';
      default:
        return 'internal-error';
    }
  }
}
