import 'package:meta/meta.dart';

import 'package:flutter_app/domain/entities/entities.dart';
import 'package:flutter_app/domain/helpers/helpers.dart';
import 'package:flutter_app/domain/usecases/usecases.dart';

import 'package:flutter_app/data/cache/cache.dart';

class LocalLoadCurrentAccount implements LoadCurrentAccount {
  final FetchSecureCacheStorage fetchSecureCacheStorage;

  LocalLoadCurrentAccount({@required this.fetchSecureCacheStorage});

  Future<AccountEntity> load() async {
    try {
      final token = await fetchSecureCacheStorage.fetch('token');
      return AccountEntity(token: token);
    } catch (error) {
      throw DomainError.unexpected;
    }
  }
}
