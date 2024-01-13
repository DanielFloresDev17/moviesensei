

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviesensei/infrastructure/datasources/isar_datasource.dart';
import 'package:moviesensei/infrastructure/repositories/local_storage_repository_implementation.dart';

final localStorageRepositoryProvider = Provider((ref) {
  return LocalStorageRepositoryImplementation(IsarDatasource());
});