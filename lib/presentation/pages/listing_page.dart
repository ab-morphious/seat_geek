import 'package:flutter/material.dart';
import 'package:seat_geek/domain/usecases/get_events.dart';

class ListingPage extends StatelessWidget {
  const ListingPage({this.onPressed});
  final onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: onPressed,
          child: Text('Click me'),
        ),
      ),
    );
  }
}
