import 'package:flutter/material.dart';
import 'package:flutter_app/ui/pages/splash/components/splash_screen.dart';

import '../../mixins/mixins.dart';
import './splash_presenter.dart';

class SplashPage extends StatelessWidget with NavegationManager {
  final SplashPresenter presenter;

  SplashPage({@required this.presenter});

  @override
  Widget build(BuildContext context) {
    presenter.checkAccount();
    return Scaffold(
      body: Builder(builder: (context) {
        handleNavigation(presenter.navigateToStream, clear: true);
        return SplashScreen();
      }),
    );
  }
}
