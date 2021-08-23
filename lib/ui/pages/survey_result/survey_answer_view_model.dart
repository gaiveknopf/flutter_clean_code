// import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

// class SurveyResultViewModel extends Equatable {
class SurveyAnswerViewModel {
  final String image;
  final String answer;
  final bool isCurrentAnswer;
  final String percent;

  // List get props => [image, answer, date, didAnswer];

  SurveyAnswerViewModel({
    this.image,
    @required this.answer,
    @required this.isCurrentAnswer,
    @required this.percent,
  });
}
