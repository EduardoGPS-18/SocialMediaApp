import 'package:flutter/foundation.dart';

enum FirebaseCloudFirestoreError {
  invalidData,
  internalError,
}

extension FirebaseCloudFirestoreErrorExtension on FirebaseCloudFirestoreError {
  String get name => describeEnum(this);

  String get code {
    switch (this) {
      default:
        return 'internal-error';
    }
  }
}
