import 'package:flutter/material.dart';

import '../../../../ui/pages/pages.dart';
import 'post.dart';

Widget makePostPage() => PostPage(presenter: makePostPresenter());
