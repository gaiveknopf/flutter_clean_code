import 'package:faker/faker.dart';

import 'package:flutter_app/domain/usecases/usecases.dart';

class FakerParamsFactory {
  static AddAccountParams makeAddAccount() => AddAccountParams(
        name: faker.person.name(),
        email: faker.internet.email(),
        password: faker.internet.password(),
        passwordConfirmation: faker.internet.password(),
      );

  static AuthenticationParams makeAuthentication() =>
      AuthenticationParams(email: faker.internet.email(), password: faker.internet.password());
}
