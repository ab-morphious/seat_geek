import 'package:bloc/bloc.dart';
import 'package:seat_geek/domain/usecases/get_events.dart';
import 'package:rxdart/rxdart.dart';
import 'package:seat_geek/presentation/bloc/events_event.dart';
import 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final GetEvents _getEvents;

  EventsBloc(this._getEvents) : super(EventsEmpty()) {
    on<OnQueryChanged>(
      (event, emit) async {
        final query = event.query;

        emit(EventsLoading());

        final result = await _getEvents.execute(query);
        result.fold((failure) => emit(EventsError(failure.message)),
            (data) => emit(EventsData(data)));
      },
      transformer: debounce(Duration(milliseconds: 1500)),
    );
  }

  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
