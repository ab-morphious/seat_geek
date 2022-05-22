import 'package:get_it/get_it.dart';
import 'package:seat_geek/data/datasource/event_remote_datasource.dart';
import 'package:seat_geek/data/repositories/event_repository_impl.dart';
import 'package:seat_geek/domain/usecases/get_events.dart';
import 'package:seat_geek/presentation/bloc/events_bloc.dart';
import 'package:http/http.dart' as http;

import 'domain/repositories/event_repository.dart';

final locator = GetIt.instance;

void init(){

  // bloc
  locator.registerFactory<EventsBloc>(() => EventsBloc(locator()));

  //usecase
  locator.registerLazySingleton<GetEvents>(() => GetEvents(locator()));

  //repository
  locator.registerLazySingleton<EventRepository>(
      () => EventRepositoryImpl(remoteDataSource: locator()));

  //data source
  locator.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl());

  locator.registerLazySingleton(() => http.Client);
}
