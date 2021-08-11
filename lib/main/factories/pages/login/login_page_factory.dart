import 'package:flutter/material.dart';
import 'package:flutter_app/main/factories/pages/login/login_presenter_factory.dart';

import '../../../../ui/pages/pages.dart';
import '../../factories.dart';

Widget makeLoginPage() {
  return LoginPage(makeGetxLoginPresenter());
}
