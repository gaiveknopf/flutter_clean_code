import 'package:flutter/material.dart';
import 'package:flutter_app/ui/helpers/helpers.dart';

import '../../../helpers/helpers.dart';

class NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: R.strings.name,
        icon: Icon(
          Icons.person,
        ),
      ),
      keyboardType: TextInputType.name,
    );
  }
}
