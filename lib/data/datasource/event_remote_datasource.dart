import 'dart:convert';
import 'dart:io';

import 'package:seat_geek/data/models/event.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<Event> getEvents(String query);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl({required this.apiClient});
  final http.Client apiClient;

  @override
  Future<Event> getEvents(String query) async {
    final response = await apiClient.get(Uri.parse(Urls.eventsListUrl(query)));
    if (response.statusCode == 200) {
      return Event.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }
}
