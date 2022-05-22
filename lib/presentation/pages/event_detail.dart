import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seat_geek/data/models/event_model.dart';

class EventDetail extends StatelessWidget {
  EventDetail({required this.eventModel});
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
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.arrow_back, color: Colors.blueAccent),
                      SizedBox(width: 15.0),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          eventModel.title,
                          style: const TextStyle(
                              fontSize: 26.0, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Spacer(),
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
            child: Image.network(eventModel.performers[0].image ??
                'https://montessoriinthewoods'
                    '.org/wp-content/uploads/2018/02/image-placeholder'
                    '-500x500.jpg', fit: BoxFit.fill,),
          ),
        )
      ],
    )));
  }
}
