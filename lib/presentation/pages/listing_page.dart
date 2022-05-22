import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:seat_geek/presentation/bloc/events_state.dart';
import 'package:seat_geek/presentation/pages/EventDetail.dart';

import '../bloc/events_bloc.dart';
import '../bloc/events_event.dart';

class ListingPage extends StatelessWidget {
  ListingPage({this.onPressed});
  final onPressed;

  TextEditingController? _searchTextEditingController;
  @override
  Widget build(BuildContext context) {
    _searchTextEditingController = TextEditingController();

    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Container(
          color: Colors.indigo,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TextField(
                    controller: _searchTextEditingController,
                    onChanged: (value) {
                      context.read<EventsBloc>().add(OnQueryChanged(value));
                    },
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.white70),
                      labelStyle: TextStyle(color: Colors.white),
                      iconColor: Colors.white,
                      icon: Icon(Icons.search, color: Colors.white),
                      border: OutlineInputBorder(),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      fillColor: Colors.indigo,
                      hintText: 'Search events',
                    ),
                  ),
                ),
              ),
              Container(
                child: MaterialButton(
                    onPressed: () {},
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    )),
              )
            ],
          ),
        ),
        BlocBuilder<EventsBloc, EventsState>(builder: (context, state) {
          if (state is EventsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is EventsData) {
            return Expanded(
              child: ListView.builder(
                  itemCount: state.events.events.length,
                  itemBuilder: (context, position) {
                    return Material(
                      elevation: 5.0,
                      shadowColor: Colors.black,
                      child: ListTile(
                        isThreeLine: true,
                        onTap: () => Get.to(EventDetail(
                            eventModel: state.events.events[position])),
                        dense: false,
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(state
                              .events.events[position].performers[0].image),
                        ),
                        title: Text(
                          state.events.events[position].title.toString(),
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(state.events.events[position].venue.address),
                            Text(state.events.events[position].datetimeLocal
                                .toLocal()
                                .toString()),
                          ],
                        ),
                      ),
                    );
                  }),
            );
          } else
            return SizedBox();
        })
      ],
    )));
  }
}
