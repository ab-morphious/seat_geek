import 'dart:convert';
import 'dart:io';

import 'package:seat_geek/data/exception.dart';
import 'package:seat_geek/data/models/event_model.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<EventModel> getEvents(String query);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl({required this.apiClient});
  final http.Client apiClient;

  @override
  Future<EventModel> getEvents(String query) async {
    final response = await apiClient.get(Uri.parse(Urls.eventsListUrl(query)));
    if (response.statusCode == 200) {
      print(response.body.toString());
      return EventModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
