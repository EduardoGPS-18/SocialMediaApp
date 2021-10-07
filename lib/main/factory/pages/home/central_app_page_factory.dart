import 'package:flutter/material.dart';

import '../../../../ui/pages/pages.dart';
import 'home_presenter_factory.dart';
import 'page_viewes/page_view_pages/feed/feed_page_presenter_factory.dart';

Widget makeCentralAppPage() => CentralPageApp(
      presenter: makeHomePagePresenter(),
      feedPresenter: makeFeedPresenter(),
    );
