import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seat_geek/presentation/bloc/events_bloc.dart';
import 'package:seat_geek/presentation/bloc/events_event.dart';
import 'package:seat_geek/presentation/pages/listing_page.dart';
import 'di.dart' as di;

void main() {

  di.init();

  runApp(MyApp());
}

void callApi() {}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<EventsBloc>(),
        )
      ],
      child: MaterialApp(
        title: 'Seat Geek',
        theme: ThemeData(),
        home: const ListingPage(),
      ),
    );
  }
}

class ListingPage extends StatelessWidget {
  const ListingPage({this.onPressed});
  final onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: MaterialButton(
            onPressed: () {
              di.locator<EventsBloc>().add(OnQueryChanged("Texas Rangers"));
            },
            child: Text("Click Me"),
          ),
        ),
      ),
    );
  }
}
