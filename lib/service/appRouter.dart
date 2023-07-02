import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/UI/tasks_screen.dart';

import '../UI/recycleScreen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleScreen.id:
        return MaterialPageRoute(builder: (_) => RecycleScreen());
      case TasksScreen.id:
        return MaterialPageRoute(builder: (_) => TasksScreen());
        default: return null;
    } 
  }
}
