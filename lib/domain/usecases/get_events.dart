import 'package:dartz/dartz.dart';
import 'package:seat_geek/domain/repositories/event_repository.dart';

import '../../data/failure.dart';
import '../entities/Event.dart';

class GetEvents {
  final EventRepository eventRepository;
  GetEvents(this.eventRepository);

  Future<Either<Failure, Event>> execute(String query) =>
      eventRepository.getEvents(query);
}
