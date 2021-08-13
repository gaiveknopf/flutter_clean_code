import 'package:flutter/material.dart';

import '../../../../main/factories/pages/pages.dart';
import '../../../../ui/pages/pages.dart';
import '../../factories.dart';

Widget makeSplashPage() {
  return SplashPage(presenter: makeGetxSplashPresenter());
}
