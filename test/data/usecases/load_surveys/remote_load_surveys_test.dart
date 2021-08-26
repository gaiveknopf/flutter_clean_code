import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:flutter_app/domain/entities/entities.dart';
import 'package:flutter_app/domain/helpers/helpers.dart';

import 'package:flutter_app/data/http/http.dart';
import 'package:flutter_app/data/usecases/usecases.dart';

import '../../../mocks/mocks.dart';

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  String url;
  HttpClient httpClient;
  RemoteLoadSurveys sut;
  List<Map> list;

  PostExpectation mockRequest() =>
      when(httpClient.request(url: anyNamed('url'), method: anyNamed('method')));

  void mockHttpData(List<Map> data) {
    list = data;
    mockRequest().thenAnswer((_) async => data);
  }

  void mockHttpError(HttpError error) {
    mockRequest().thenThrow(error);
  }

  setUp(() {
    url = faker.internet.httpUrl();
    httpClient = HttpClientSpy();
    sut = RemoteLoadSurveys(url: url, httpClient: httpClient);
    mockHttpData(FakeSurveysFactory.makeApiJson());
  });

  test('Should call HttpClient with correct values', () async {
    await sut.load();

    verify(httpClient.request(url: url, method: 'get'));
  });

  test('Should return surveys on 200', () async {
    final surveys = await sut.load();

    expect(surveys, [
      SurveyEntity(
        id: list[0]['id'],
        question: list[0]['question'],
        didAnswer: list[0]['didAnswer'],
        dateTime: DateTime.parse(list[0]['date']),
      ),
      SurveyEntity(
        id: list[1]['id'],
        question: list[1]['question'],
        didAnswer: list[1]['didAnswer'],
        dateTime: DateTime.parse(list[1]['date']),
      )
    ]);
  });

  test('Should throw UnexpectedError if httpClient returns 200 with invalid data', () async {
    mockHttpData(FakeSurveysFactory.makeInvalidApiJson());

    final future = sut.load();

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient returns 404', () async {
    mockHttpError(HttpError.notFound);

    final future = sut.load();

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw accessDeniedError if HttpClient returns 403', () async {
    mockHttpError(HttpError.forbidden);

    final future = sut.load();

    expect(future, throwsA(DomainError.accessDenied));
  });
}
