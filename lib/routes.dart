import 'package:flutter/widgets.dart';
import 'package:pmsn20232/screens/add_carrera.dart';
import 'package:pmsn20232/screens/add_profe.dart';
import 'package:pmsn20232/screens/add_task.dart';
import 'package:pmsn20232/screens/calendar_screen.dart';
import 'package:pmsn20232/screens/carrera_screen.dart';
import 'package:pmsn20232/screens/dashbboard_screen.dart';
// import 'package:pmsn20232/screens/detail_movie_screen.dart';
import 'package:pmsn20232/screens/login_scree.dart';
import 'package:pmsn20232/screens/popular_screen.dart';
import 'package:pmsn20232/screens/profesor_screen.dart';
import 'package:pmsn20232/screens/provider_screen.dart';
import 'package:pmsn20232/screens/task_screen.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    '/dash': (BuildContext context) => DashboardScreen(),
    '/task': (BuildContext context) => TaskScreen(),
    '/add': (BuildContext context) => AddTask(),
    '/addProfe': (BuildContext context) => AddProfesor(),
    '/profesor': (BuildContext context) => ProfesorScreen(),
    '/carrera': (BuildContext context) => CarreraScreen(),
    '/addCarrera': (BuildContext context) => AddCarrera(),
    '/popular': (BuildContext context) => PopularScreen(),
    '/dash_log': (BuildContext context) => LoginScreen(),
    // '/detail': (BuildContext context) => DetailMovieScreen(),
    '/prov': (BuildContext context) => ProviderScreen(),
    '/cal': (BuildContext context) => CalendarScreen(),
  };
}
