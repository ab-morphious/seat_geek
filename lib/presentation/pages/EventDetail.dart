import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:seat_geek/data/models/event_model.dart';
import 'package:seat_geek/presentation/bloc/events_state.dart';

import '../bloc/events_bloc.dart';
import '../bloc/events_event.dart';

class EventDetail extends StatelessWidget {
  EventDetail({required this.eventModel});
  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [

      ],
    )));
  }
}
