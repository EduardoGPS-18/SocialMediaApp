import 'package:flutter/foundation.dart';

enum FirebaseCloudFirestoreError {
  invalidData,
  internalError,
}

extension FirebaseCloudFirestoreErrorExtension on FirebaseCloudFirestoreError {
  String get name => describeEnum(this);

  String get code {
    switch (this) {
      case FirebaseCloudFirestoreError.invalidData:
        return 'invalid-data';
      case FirebaseCloudFirestoreError.internalError:
        return 'internal-error';
      default:
        return 'internal-error';
    }
  }
}
