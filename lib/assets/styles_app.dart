import 'package:flutter/material.dart';

class StylesApp {
  static ThemeData ligthTheme(BuildContext context) {
    final theme = ThemeData.light();
    return theme.copyWith(
//primaryColor: Color.fromARGB(255, 255, 0, 0),

        colorScheme: Theme.of(context)
            .colorScheme
            .copyWith(primary: Color.fromARGB(255, 115, 165, 189)
                // background: Color.fromARGB(255, 255, 100, 100)
                ));
  }

  static ThemeData darkTheme(BuildContext context) {
    final theme = ThemeData.light();
    return theme.copyWith(
//primaryColor: Color.fromARGB(255, 255, 0, 0),

        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: Color.fromARGB(255, 0, 0, 0),
            ));
  }
}
