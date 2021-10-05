import 'package:flutter/material.dart';

import '../../../../ui/pages/auth/auth_page.dart';
import 'auth.dart';

Widget makeAuthPage() => AuthPage(
      presenter: makeAuthPagePresenter(),
    );
