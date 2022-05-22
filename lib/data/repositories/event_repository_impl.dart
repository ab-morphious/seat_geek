
import 'package:dartz/dartz.dart';
import 'package:seat_geek/data/failure.dart';
import 'package:seat_geek/data/models/event.dart';
import '../../domain/repositories/event_repository.dart';

class EventRepositoryImpl implements EventRepository{
  @override
  Future<Either<Failure, Event>> getEvents(String query) {

    throw UnimplementedError();
  }
}