import 'package:flutter/material.dart';

import 'components/components.dart';
import '../../helpers/helpers.dart';
import '../../../../ui/components/components.dart';

class SignUpPage extends StatelessWidget {
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
