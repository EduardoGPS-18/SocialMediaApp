import 'package:flutter/material.dart';

import '../../../../ui/pages/pages.dart';
import 'core.dart';

Widget makeCorePage() => CorePageApp(
      presenter: makeCorePresenter(),
      feedPresenter: makeFeedPresenter(),
      profilePresenter: makeProfilePresenter(),
    );
