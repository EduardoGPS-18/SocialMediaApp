import 'package:flutter/material.dart';

import '../../../../ui/pages/pages.dart';
import 'core.dart';

Widget makeCorePage() => CorePageApp(
      corePresenter: makeCorePresenter(),
      feedPresenter: makeFeedPresenter(),
      profilePresenter: makeProfilePresenter(),
    );
