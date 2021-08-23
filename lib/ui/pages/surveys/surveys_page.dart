import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../components/components.dart';
import '../../helpers/helpers.dart';
import './components/components.dart';
import './surveys.dart';

class SurveysPage extends StatelessWidget {
  final SurveysPresenter presenter;

  SurveysPage(this.presenter);

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
      body: Builder(
        builder: (context) {
          presenter.loadData();

          presenter.isLoadingStream.listen((isLoading) {
            if (isLoading == true) {
              showLoading(context);
            } else {
              hideLoading(context);
            }
          });

          return Container(
              child: ListView(
            children: [
              StreamBuilder(
                stream: presenter.mainErrorStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ReloadScreen(
                      error: snapshot.data,
                      reload: presenter.loadData,
                    );
                  }
                  return SizedBox(height: 0);
                },
              ),
              StreamBuilder<List<SurveyViewModel>>(
                  stream: presenter.surveysStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SurveyItems(snapshot.data);
                    }
                    return SizedBox(height: 0);
                  }),
            ],
          ));
        },
      ),
    );
  }
}
