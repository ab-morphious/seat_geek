import 'package:flutter/material.dart';
import 'package:seat_geek/domain/usecases/get_events.dart';
import 'package:seat_geek/presentation/pages/listing_page.dart';

import 'di.dart' as di;
import 'di.dart';
void main() async{

  await di.init();
  locator<GetEvents>().execute("Texas Rangers");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const ListingPage(),
    );
  }
}
