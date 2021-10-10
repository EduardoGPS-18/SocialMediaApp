import 'package:flutter/material.dart';

import '../../../../ui/pages/pages.dart';
import 'core_create_post_presenter_factory.dart';

Widget makeCreatePostPage() => CreatePostPage(presenter: makeCreatePostPresenter());
