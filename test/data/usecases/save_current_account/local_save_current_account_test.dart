import 'package:faker/faker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:flutter_app/domain/helpers/helpers.dart';
import 'package:flutter_app/domain/entities/entities.dart';

import 'package:flutter_app/data/cache/cache.dart';
import 'package:flutter_app/data/usecases/usecases.dart';

import 'local_save_current_account_test.mocks.dart';

@GenerateMocks([SaveSecureCacheStorage])
void main() {
  late MockSaveSecureCacheStorage saveSecureCacheStorage;
  late LocalSaveCurrentAccout sut;
  late AccountEntity account;

  setUp(() {
    saveSecureCacheStorage = MockSaveSecureCacheStorage();
    sut = LocalSaveCurrentAccout(saveSecureCacheStorage: saveSecureCacheStorage);
    account = AccountEntity(faker.guid.guid());
  });

  void mockError() {
    when(saveSecureCacheStorage.saveSecure(key: anyNamed('key'), value: anyNamed('value')))
        .thenThrow(Exception());
  }

  test('Should call SaveSecureCacheStorage with correct values', () async {
    await sut.save(account);
    verify(saveSecureCacheStorage.saveSecure(key: 'token', value: account.token));
  });

  test('Should throw UnexpectedError if SaveSecureCacheStorage throws', () async {
    mockError();

    final future = sut.save(account);

    expect(future, throwsA(DomainError.unexpected));
  });
}
