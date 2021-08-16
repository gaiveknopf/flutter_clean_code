import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      margin: EdgeInsets.only(bottom: 32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor,
          ],
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            spreadRadius: 0,
            blurRadius: 4,
            color: Colors.black,
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(80),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(70.0),
        child: Image(
          image: AssetImage('lib/ui/assets/logo.png'),
          // fit: BoxFit.scaleDown,
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}
