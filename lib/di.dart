import 'package:get_it/get_it.dart';
import 'package:seat_geek/data/datasource/event_remote_datasource.dart';
import 'package:seat_geek/data/repositories/event_repository_impl.dart';
import 'package:seat_geek/domain/repositories/event_repository.dart';
import 'package:seat_geek/domain/usecases/get_events.dart';
import 'package:seat_geek/presentation/pages/listing_page.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

Future<void> init() async{
  locator.registerSingleton(() => ListingPage());

  locator.registerSingleton(() => GetEvents(locator()));

  locator.registerLazySingleton<EventRepository>(
      () => EventRepositoryImpl(remoteDataSource: locator()));

  locator.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(apiClient: locator()));

  locator.registerLazySingleton(() => http.Client);
}
