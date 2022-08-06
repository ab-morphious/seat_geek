import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seat_geek/data/models/event_model.dart';

class EventDetail extends StatelessWidget {
  const EventDetail({required this.eventModel});
  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 90.0,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                                Platform.isAndroid
                                    ? Icons.arrow_back
                                    : Icons.arrow_back_ios,
                                color: Colors.blueAccent),
                          ),
                          onTap: () => Get.back()),
                      const SizedBox(width: 15.0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          eventModel.title,
                          style: const TextStyle(
                              fontSize: 26.0, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(25.0),
          color: Colors.black26,
          child: const SizedBox(
            height: 1,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              eventModel.performers[0].image ??
                  'https://montessoriinthewoods'
                      '.org/wp-content/uploads/2018/02/image-placeholder'
                      '-500x500.jpg',
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20.0),
          child: Text(
            eventModel.datetimeLocal.toIso8601String(),
            style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
          child: Text(
            eventModel.venue.address,
            style: const TextStyle(fontSize: 20.0),
          ),
        ),
      ],
    )));
  }
}
