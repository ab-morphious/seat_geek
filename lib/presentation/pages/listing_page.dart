import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seat_geek/presentation/bloc/events_state.dart';

import '../bloc/events_bloc.dart';
import '../bloc/events_event.dart';

class ListingPage extends StatelessWidget {
  ListingPage({this.onPressed});
  final onPressed;

  TextEditingController? _searchTextEditingController;
  @override
  Widget build(BuildContext context) {
    //context.read<EventsBloc>().add(OnQueryChanged("Texas Rangers"));
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
                    decoration: InputDecoration(
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
                    child: Text(
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
          }else if(state is EventsData) {
            return ListView.builder(
                itemCount: state.events.events.length,
                itemBuilder: (context, position) {
                return ListTile(
                  leading: Image.network(state.events.events[position].performer.image),
                  title: Text(state.events.events[position].title.toString()),
                );
            });
            }
          else return SizedBox();
        })
      ],
    )));
  }
}
