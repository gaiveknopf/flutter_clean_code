import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../components/components.dart';
import '../../helpers/helpers.dart';
import 'components/components.dart';
import 'surveys.dart';

class SurveysPage extends StatelessWidget {
  final SurveysPresenter presenter;

  SurveysPage(this.presenter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(R.strings.surveys)),
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
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          snapshot.data,
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: presenter.loadData,
                          child: Text(R.strings.reload),
                        )
                      ],
                    );
                  }
                  return SizedBox(height: 0);
                },
              ),
              StreamBuilder<List<SurveyViewModel>>(
                  stream: presenter.surveysStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: CarouselSlider(
                          options: CarouselOptions(enlargeCenterPage: true, aspectRatio: 1),
                          items: snapshot.data
                              .map(
                                (viewModel) => SurveyItem(viewModel),
                              )
                              .toList(),
                        ),
                      );
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
