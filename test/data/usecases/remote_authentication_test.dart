import 'package:faker/faker.dart';
// import 'package:mockito/mockito.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:flutter_app/domain/usecases/usecases.dart';
import 'package:flutter_app/domain/helpers/helpers.dart';

import 'package:flutter_app/data/http/http.dart';
import 'package:flutter_app/data/usecases/usecases.dart';

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  RemoteAuthentication? sut;
  HttpClientSpy? httpClient;
  String? url;
  AuthenticationParams? params;

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    sut = RemoteAuthentication(httpClient: httpClient!, url: url!);
    params = AuthenticationParams(
      email: faker.internet.email(),
      password: faker.internet.password(),
    );
  });

  test('Should call HttpClient with correct values', () async {
    await sut!.auth(params!);
    verify(() => httpClient!.request(
        url: url!,
        method: 'post',
        body: {'email': params!.email, 'password': params!.password}));
  });

  test('Should throw UnexpectedError if HttpClient returns 400', () async {
    when(() => httpClient!.request(
          method: any(named: 'method'),
          url: any(named: 'url'),
          body: any(named: 'body'),
        )).thenThrow(HttpError.badRequest);

    final future = sut!.auth(params!);
    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient returns 404', () async {
    when(() => httpClient!.request(
          method: any(named: 'method'),
          url: any(named: 'url'),
          body: any(named: 'body'),
        )).thenThrow(HttpError.notFound);

    final future = sut!.auth(params!);
    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient returns 500', () async {
    when(() => httpClient!.request(
          method: any(named: 'method'),
          url: any(named: 'url'),
          body: any(named: 'body'),
        )).thenThrow(HttpError.serverError);

    final future = sut!.auth(params!);
    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient returns 401', () async {
    when(() => httpClient!.request(
          method: any(named: 'method'),
          url: any(named: 'url'),
          body: any(named: 'body'),
        )).thenThrow(HttpError.unauthorized);

    final future = sut!.auth(params!);
    expect(future, throwsA(DomainError.invalidCredentials));
  });
}
