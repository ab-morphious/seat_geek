import 'package:flutter/material.dart';
import 'package:seat_geek/presentation/pages/listing_page.dart';

import 'di.dart' as di;
import 'di.dart';
import 'domain/usecases/get_events.dart';
void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(MyApp());
}
void callApi()
{
  di.locator<GetEvents>().execute("Texas Rangers");
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const ListingPage(onPressed: callApi),
    );
  }
}
