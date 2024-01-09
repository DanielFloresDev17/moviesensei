

import 'package:moviesensei/domain/datasources/actors_datasource.dart';
import 'package:moviesensei/domain/entities/actor.dart';
import 'package:moviesensei/domain/repositories/actors_repository.dart';

class ActorRepositoryImplementation extends ActorsRepository {
  
  final ActorsDatasource datasource;

  ActorRepositoryImplementation(this.datasource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId);
  }

}