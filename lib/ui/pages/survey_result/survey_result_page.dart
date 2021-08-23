import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../helpers/helpers.dart';

class SurveyResultPage extends StatelessWidget {
  final storage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          R.strings.surveys,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await storage.deleteAll();
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              padding: EdgeInsets.only(top: 40, bottom: 20, left: 20, right: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).disabledColor.withAlpha(90),
              ),
              child: Text('Qual é seu framework web favorito?'),
            );
          }
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      'http://fordevs.herokuapp.com/static/img/logo-react.png',
                      width: 40,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'React',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    Text(
                      '100%',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[900],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.check_circle,
                        color: Theme.of(context).highlightColor,
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                height: 1,
              )
            ],
          );
        },
        itemCount: 4,
      ),
    );
  }
}