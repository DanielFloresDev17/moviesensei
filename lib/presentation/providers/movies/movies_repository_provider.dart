import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviesensei/infrastructure/datasources/moviedb_datasource.dart';
import 'package:moviesensei/infrastructure/repositories/movie_repository_implementation.dart';

//Repositorio inmuntable
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImplementation(MoviedbDatasource());
});