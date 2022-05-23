import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:seat_geek/presentation/bloc/events_state.dart';
import 'package:seat_geek/presentation/pages/event_detail.dart';

import '../../utils.dart';
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
          color: ColorConstants.kTopColor,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                 /* child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: _searchTextEditingController,
                    onChanged: (value) {
                      context.read<EventsBloc>().add(OnQueryChanged(value));
                    },
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.white70),
                      labelStyle: TextStyle(color: Colors.white),
                      floatingLabelStyle: TextStyle(color: Colors.white70),
                      iconColor: Colors.white,
                      icon: Icon(Icons.search, color: Colors.white),
                      border: OutlineInputBorder(),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: 'Search events',
                    ),
                  ),*/
                     child: Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(5.0),
                         color: Colors.white.withOpacity(0.1)
                       ),
                       child: ListTile(
                        leading: const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 28,
                        ),
                        title: TextField(
                          controller: _searchTextEditingController,
                          onChanged: (value){
                            context.read<EventsBloc>().add(OnQueryChanged(value));
                          },
                          decoration: const InputDecoration(
                            hintText: 'type in journal name...',
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                            ),
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                    ),
                     ),
                ),
              ),
              Container(
                child: MaterialButton(
                    onPressed: () {
                      _searchTextEditingController?.clear();
                    },
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
            return Center(
                child: LoadingAnimationWidget.horizontalRotatingDots(
                    color: ColorConstants.kTopColor, size: 70));
          } else if (state is EventsData) {
            return Expanded(
              child: ListView.builder(
                  itemCount: state.events.events.length,
                  itemBuilder: (context, position) {
                    return Column(
                      children: [
                        ListTile(
                          isThreeLine: true,
                          onTap: () => Get.to(EventDetail(
                              eventModel: state.events.events[position])),
                          dense: false,
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(state.events.events[position]
                                    .performers[0].image ??
                                'https://montessoriinthewoods.org/wp-content/uploads/2018/02/image-placeholder-500x500.jpg'),
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
                        SizedBox(
                          height: 1.5,
                          child: Container(color: Colors.black12),
                        )
                      ],
                    );
                  }),
            );
          } else {
            return SizedBox();
          }
        })
      ],
    )));
  }
}
