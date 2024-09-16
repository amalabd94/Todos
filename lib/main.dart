import 'package:apires/helper/app_routes.dart';
import 'package:flutter/material.dart';


import 'core/views/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: AppLight,
      home: HomeScreen(),
      initialRoute: '/home',
      onGenerateRoute: AppRoutes.routeManager,
    );
  }
}