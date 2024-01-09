
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviesensei/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:moviesensei/infrastructure/repositories/actor_repository_implementation.dart';

//Repositorio inmuntable
final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImplementation(ActorMovieDbDatasource());
});