import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:seat_geek/presentation/bloc/events_bloc.dart';
import 'package:seat_geek/presentation/bloc/events_event.dart';
import 'package:seat_geek/presentation/pages/listing_page.dart';
import 'package:seat_geek/utils.dart';
import 'di.dart' as di;

void main() {
  di.init();

  runApp(MyApp());
}

void callApi() {}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: ColorConstants.kTopColor
    ));
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<EventsBloc>(),
        )
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Seat Geek',
        home: ListingPage(),
      ),
    );
  }
}
