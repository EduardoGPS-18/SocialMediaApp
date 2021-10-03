import 'package:flutter/foundation.dart';

enum FirebaseFirestoreError {
  invalidData,
  internalError,
}

extension FirebaseFirestoreErrorExtension on FirebaseFirestoreError {
  String get name => describeEnum(this);

  String get code {
    switch (this) {
      default:
        return 'internal-error';
    }
  }
}
