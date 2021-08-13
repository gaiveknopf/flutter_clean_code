import 'package:flutter/material.dart';
import 'package:flutter_app/ui/helpers/helpers.dart';
import 'package:provider/provider.dart';

import '../login_presenter.dart';
import '../../../helpers/helpers.dart';

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context);
    return StreamBuilder<UIError>(
        stream: presenter.emailErrorStream,
        builder: (context, snapshot) {
          return TextFormField(
            decoration: InputDecoration(
              labelText: R.strings.password,
              icon: Icon(
                Icons.email,
              ),
              errorText: snapshot.hasData ? snapshot.data.description : null,
            ),
            keyboardType: TextInputType.emailAddress,
            onChanged: presenter.validateEmail,
          );
        });
  }
}
