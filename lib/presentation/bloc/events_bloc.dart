
import 'package:seat_geek/domain/usecases/get_events.dart';

class EventsBloc extends BLoc<EventsEvent, EventsState>{
  final GetEvents _getEvents;

  EventsBloc(this._getEvents) : super(EventsEmpty()) {
    on<OnQueryChange>(
        (event, emit) async{
          final query = event.query;

          emit(EventsLoading());

          final result = await _getEvents.execute(query);
          result.fold((failure) =>
              emit(EventsError(failure.message)),
                  (data) => emit(EventsData(data)
                  )
          );
        }
    );
  }
}