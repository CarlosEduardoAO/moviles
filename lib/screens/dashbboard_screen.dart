import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:pmsn20232/assets/global_values.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('sessionSaved');
    Navigator.pushReplacementNamed(context, '/dash_log');
  }

  @override
  Widget build(BuildContext context) {
    final btnLoL = FloatingActionButton.extended(
        icon: Icon(Icons.check),
        label: Text('Vamos!'),
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        });

    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido :)'),
      ),
      drawer: createDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: btnLoL,
    );
  }

  Widget createDrawer() {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
              ),
              accountName: Text('Carlos Eduardo Aguilar Ordoñez'),
              accountEmail: Text('180324770@itcelaya.edu.mx')),
          ListTile(
            //leading: Image.network('https://img.icons8.com/?size=1x&id=95287&format=png'),
            trailing: Icon(Icons.chevron_right),
            title: Text('FruitApp'),
            subtitle: Text('Carrousel'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.task_alt_outlined),
            trailing: Icon(Icons.chevron_right),
            title: Text('Task Manager'),
            onTap: () => Navigator.pushNamed(context, '/task'),
          ),
          ListTile(
            leading: Icon(Icons.task_alt_outlined),
            trailing: Icon(Icons.chevron_right),
            title: Text('Test Provider'),
            onTap: () => Navigator.pushNamed(context, '/prov'),
          ),
          ListTile(
            leading: Icon(Icons.task_alt_outlined),
            trailing: Icon(Icons.chevron_right),
            title: Text('Calendar'),
            onTap: () => Navigator.pushNamed(context, '/cal'),
          ),
          ListTile(
            leading: Icon(Icons.movie),
            trailing: Icon(Icons.chevron_right),
            title: Text('Movies'),
            subtitle: Text('Acerca de...'),
            onTap: () => Navigator.pushNamed(context, '/popular'),
          ),
          DayNightSwitcher(
            isDarkModeEnabled: GlobalValues.flagTheme.value,
            onStateChanged: (isDarkModeEnabled) {
              GlobalValues.flagTheme.value = isDarkModeEnabled;
              GlobalValues().guardarValor(isDarkModeEnabled);
            },
          ),
          ListTile(
            leading: Icon(
                Icons.logout), // Ícono de cerrar sesión o foto relacionada xd
            title: Text('Cerrar sesión'),
            onTap: () {
              logout(); // Llama a la función logout al hacer clic en "Cerrar sesión"
            },
          )
        ],
      ),
    );
  }
}
