import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../domain/helpers/helpers.dart';
import '../../domain/usecases/usecases.dart';

import '../../ui/helpers/helpers.dart';
import '../../ui/pages/pages.dart';

class GetxSurveysPresenter implements SurveysPresenter {
  final LoadSurveys loadSurveys;

  final _isLoading = true.obs;
  final _surveys = RxList<SurveyViewModel>();
  final _mainError = RxString('');

  Stream<bool> get isLoadingStream => _isLoading.stream;
  Stream<List<SurveyViewModel>> get surveysStream => _surveys.stream;
  Stream<String> get mainErrorStream => _mainError.stream;

  GetxSurveysPresenter({@required this.loadSurveys});

  Future<void> loadData() async {
    try {
      _mainError.value = '';
      _isLoading.value = true;
      final surveys = await loadSurveys.load();
      _surveys.value = surveys
          .map((survey) => SurveyViewModel(
                id: survey.id,
                question: survey.question,
                date: DateFormat('dd MMM yyyy').format(survey.dateTime),
                didAnswer: survey.didAnswer,
              ))
          .toList();
    } on DomainError {
      _mainError.value = UIError.unexpected.description;
    } finally {
      _isLoading.value = false;
    }
  }
}