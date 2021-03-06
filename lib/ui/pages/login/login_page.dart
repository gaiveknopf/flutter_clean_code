import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import 'components/components.dart';
import '../../helpers/helpers.dart';
import '../../../../ui/components/components.dart';
import '../../pages/pages.dart';

class LoginPage extends StatelessWidget {
  final LoginPresenter presenter;

  LoginPage(this.presenter);

  @override
  Widget build(BuildContext context) {
    void _hideKeyboard() {
      final currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }

    return Scaffold(
      body: Builder(
        builder: (context) {
          presenter.isLoadingStream.listen((isLoading) {
            if (isLoading) {
              showDLoading(context);
            } else {
              hideLoading(context);
            }
          });

          presenter.mainErrorStream.listen((error) {
            if (error != null) {
              showErrorMessage(context, error.description);
            }
          });

          presenter.navigateToStream.listen((page) {
            if (page!.isNotEmpty == true) {
              Get.offAllNamed(page);
            }
          });

          return Container(
            color: Theme.of(context).backgroundColor,
            width: double.infinity,
            height: double.infinity,
            child: GestureDetector(
              onTap: _hideKeyboard,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    LoginHeader(),
                    HeadLine1(text: R.strings.login),
                    Padding(
                      padding: EdgeInsets.all(32),
                      child: Provider(
                        create: (_) => presenter,
                        child: Form(
                          child: Column(
                            children: [
                              EmailInput(),
                              Padding(
                                padding: EdgeInsets.only(top: 8, bottom: 32),
                                child: PasswordInput(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: LoginButton(),
                              ),
                              // TextButton.icon(
                              //   onPressed: () {},
                              //   icon: Icon(Icons.person),
                              //   label: Text(R.strings.addAccount),
                              // )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
