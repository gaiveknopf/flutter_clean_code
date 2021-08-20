import 'package:flutter/material.dart';

import 'package:flutter_app/main/factories/pages/pages.dart';

import '../../../../ui/pages/pages.dart';
import '../../factories.dart';

Widget makeLoginPage() {
  return LoginPage(makeGetxLoginPresenter());
}
