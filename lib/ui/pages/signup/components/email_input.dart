import 'package:flutter/material.dart';
import 'package:flutter_app/ui/helpers/helpers.dart';

import '../../../helpers/helpers.dart';

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: R.strings.email,
        icon: Icon(
          Icons.email,
        ),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
