
import 'package:apires/core/views/screens/allTodos.dart';
import 'package:apires/core/views/screens/completedTod.dart';
import 'package:apires/core/views/screens/incompletedTod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/views/screens/home_screen.dart';
import '../core/views/screens/not_foundscreen.dart';

class AppRoutes{
  static Route<dynamic>? routeManager(RouteSettings route) {
    switch (route.name) {
      case '/home':
        return MaterialPageRoute(builder: (ctx) => HomeScreen());
      case '/completed':
        return MaterialPageRoute(builder: (ctx) => CompletedTod());
      case '/incompleted':
        return MaterialPageRoute(builder: (ctx) => IncompletedTod());
      case '/alltod':
        return MaterialPageRoute(builder: (ctx) => AllTodos());
      default:
        return MaterialPageRoute(builder: (ctx) => NotFoundscreen());
    }
  }
}