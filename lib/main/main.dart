import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/main/factories/pages/pages.dart';

import 'package:flutter_app/ui/components/components.dart';

import 'package:get/route_manager.dart';

import 'package:flutter_app/main/factories/pages/login/login_page_factory.dart';
import 'package:provider/provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return GetMaterialApp(
      title: 'Databox',
      // debugShowCheckedModeBanner: false,
      theme: makeAppTheme(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: makeSplashPage, transition: Transition.fade),
        GetPage(name: '/login', page: makeLoginPage, transition: Transition.fadeIn),
        GetPage(name: '/surveys', page: makeLoginPage, transition: Transition.fadeIn),
        // GetPage(
        //   name: '/surveys',
        //   page: () => Scaffold(
        //     body: Text('MENU'),
        //   ),
        //   transition: Transition.fadeIn,
        // ),
      ],
    );
  }
}
