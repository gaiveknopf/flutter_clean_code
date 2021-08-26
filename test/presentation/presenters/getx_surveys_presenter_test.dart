import 'package:flutter_app/domain/helpers/helpers.dart';
import 'package:flutter_app/ui/helpers/helpers.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:flutter_app/domain/usecases/usecases.dart';
import 'package:flutter_app/domain/entities/entities.dart';
import 'package:flutter_app/ui/pages/pages.dart';
import 'package:flutter_app/presentation/presenters/presenters.dart';

import '../../mocks/mocks.dart';

class LoadSurveysSpy extends Mock implements LoadSurveys {}

void main() {
  GetxSurveysPresenter sut;
  LoadSurveysSpy loadSurveys;
  List<SurveyEntity> surveys;

  PostExpectation mockLoadSurveysCall() => when(loadSurveys.load());

  void mockLoadSurveys(List<SurveyEntity> data) {
    surveys = data;
    mockLoadSurveysCall().thenAnswer((_) async => surveys);
  }

  void mockLoadSurveysError() => mockLoadSurveysCall().thenThrow(DomainError.unexpected);

  void mockAccessDeniedError() => mockLoadSurveysCall().thenThrow(DomainError.accessDenied);

  setUp(() {
    loadSurveys = LoadSurveysSpy();
    sut = GetxSurveysPresenter(loadSurveys: loadSurveys);
    mockLoadSurveys(FakeSurveysFactory.makeEntity());
  });

  test('Should call loadSurveys on loadData', () async {
    await sut.loadData();
    verify(loadSurveys.load()).called(1);
  });

  test('Should emit correct events on success', () async {
    expectLater(sut.isLoadingStream, emitsInOrder([true, false]));
    sut.surveysStream.listen(expectAsync1((surveys) => expect(surveys, [
          SurveyViewModel(
              id: surveys[0].id,
              question: surveys[0].question,
              date: '26 Aug 2021',
              didAnswer: surveys[0].didAnswer),
          SurveyViewModel(
              id: surveys[1].id,
              question: surveys[1].question,
              date: '26 Aug 2021',
              didAnswer: surveys[1].didAnswer),
        ])));
    await sut.loadData();
  });

  test('Should emit correct events on failure', () async {
    mockLoadSurveysError();

    expectLater(sut.isLoadingStream, emitsInOrder([true, false]));
    sut.surveysStream.listen(null,
        onError: expectAsync1((error) => expect(error, UIError.unexpected.description)));

    await sut.loadData();
  });

  test('Should emit correct events on access denied', () async {
    mockAccessDeniedError();

    expectLater(sut.isLoadingStream, emitsInOrder([true, false]));
    expectLater(sut.isSessionExpiredStream, emits(true));

    await sut.loadData();
  });

  test('Should go to SurveyResultPage on survey click', () async {
    expectLater(
        sut.navigateToStream,
        emitsInOrder([
          '/survey_result/1',
          '/survey_result/1',
        ]));

    sut.goToSurveyResult('1');
    sut.goToSurveyResult('1');
  });
}
