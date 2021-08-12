import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: makeLoginPage),
        GetPage(
            name: '/surveys',
            page: () => Scaffold(
                  body: Text('Enquetes'),
                )),
      ],
    );
  }
}
