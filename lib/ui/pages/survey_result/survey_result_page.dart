import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../pages/survey_result/components/components.dart';
import '../../components/components.dart';
import '../../pages/pages.dart';

import '../../helpers/helpers.dart';

class SurveyResultPage extends StatelessWidget {
  final SurveyResultPresenter presenter;

  SurveyResultPage(this.presenter);

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
          presenter.isLoadingStream.listen((isLoading) {
            if (isLoading == true) {
              showLoading(context);
            } else {
              hideLoading(context);
            }
          });

          presenter.loadData();

          return StreamBuilder<SurveyResultViewModel>(
            stream: presenter.surveyResultStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return ReloadScreen(error: snapshot.error, reload: presenter.loadData);
              }
              if (snapshot.hasData) {
                return SurveyResult(snapshot.data);
              }
              return SizedBox(height: 0);
            },
          );
        },
      ),
    );
  }
}
