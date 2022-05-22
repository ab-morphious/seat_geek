import 'package:equatable/equatable.dart';
import 'package:seat_geek/data/models/event_model.dart';


abstract class EventsState extends Equatable {
  const EventsState();

  @override
  List<Object?> get props => [];
}

class EventsEmpty extends EventsState {}

class EventsLoading extends EventsState {}

class EventsError extends EventsState {
  final String message;

  EventsError(this.message);

  @override
  List<Object?> get props => [message];
}

class EventsData extends EventsState {
  final Events events;
  const EventsData(this.events);

  @override
  List<Object?> get props => [events];
}
