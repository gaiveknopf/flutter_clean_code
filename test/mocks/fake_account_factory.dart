import 'package:faker/faker.dart';

import 'package:flutter_app/domain/entities/entities.dart';

class FakeAccountFactory {
  static Map makeApiJson() => {
        'accessToken': faker.guid.guid(),
        'name': faker.person.name(),
      };

  static AccountEntity makeEntity() => AccountEntity(token: faker.guid.guid());
}