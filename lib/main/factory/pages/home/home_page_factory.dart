import 'package:flutter/material.dart';

import '../../../../ui/pages/pages.dart';
import 'home_presenter_factory.dart';

Widget makeHomePage() => HomePage(presenter: makeHomePagePresenter());
