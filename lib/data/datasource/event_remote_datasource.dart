import 'dart:convert';
import 'dart:io';

import 'package:seat_geek/data/exception.dart';
import 'package:seat_geek/data/models/event_model.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<Events> getEvents(String query);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl();

  @override
  Future<Events> getEvents(String query) async {
    final response = await http.get(Uri.parse(Urls.eventsListUrl(query)));
    if (response.statusCode == 200) {
      return Events.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
