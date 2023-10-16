import 'package:flutter/material.dart';
import 'package:pmsn20232/assets/global_values.dart';
import 'package:pmsn20232/assets/styles_app.dart';
import 'package:pmsn20232/provider/test_provider.dart';
import 'package:pmsn20232/routes.dart';
import 'package:pmsn20232/screens/login_scree.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    GlobalValues().leerValor();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: GlobalValues.flagTheme,
        builder: (context, value, _) {
          return ChangeNotifierProvider(
            create: (context) => TestProvider(),
            child: MaterialApp(
                home: LoginScreen(),
                routes: getRoutes(),
                theme: value
                    ? StylesApp.darkTheme(context)
                    : StylesApp.ligthTheme(context)
                /*routes: {
              '/dash' : (BuildContext context) => LoginScreen()
            },*/
                ),
          );
        });
  }
}
