import 'package:dartz/dartz.dart';

import '../../data/failure.dart';
import '../../data/models/event_model.dart';
import '../entities/Event.dart';

abstract class EventRepository {
  Future<Either<Failure, Event>> getEvents(String query);
}
