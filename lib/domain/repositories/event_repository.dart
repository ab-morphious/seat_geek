import 'package:dartz/dartz.dart';
import '../../data/failure.dart';
import '../../data/models/event_model.dart';

//Repository contract
abstract class EventRepository {
  Future<Either<Failure, Events>> getEvents(String query);
}
