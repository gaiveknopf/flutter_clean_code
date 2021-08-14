import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './signup_presenter.dart';
import 'components/components.dart';
import '../../helpers/helpers.dart';
import '../../../../ui/components/components.dart';

class SignUpPage extends StatelessWidget {
  final SignUpPresenter presenter;

  SignUpPage(this.presenter);

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

          return GestureDetector(
            onTap: _hideKeyboard,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LoginHeader(),
                  HeadLine1(text: R.strings.addAccount),
                  Padding(
                    padding: EdgeInsets.all(32),
                    child: Provider(
                      create: (_) => presenter,
                      child: Form(
                        child: Column(
                          children: [
                            NameInput(),
                            Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: EmailInput(),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: PasswordInput(),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8, bottom: 32),
                              child: PasswordConfirmationInput(),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: SignUpButton(),
                            ),
                            TextButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.logout),
                              label: Text(R.strings.login),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
