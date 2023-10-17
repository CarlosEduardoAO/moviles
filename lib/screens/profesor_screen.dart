import 'package:flutter/material.dart';
import 'package:pmsn20232/assets/global_values.dart';
import 'package:pmsn20232/database/agenda_db.dart';
import 'package:pmsn20232/models/profesor_model.dart';
import 'package:pmsn20232/models/task_models.dart';
import 'package:pmsn20232/widgets/CardProfeWidget.dart';

class ProfesorScreen extends StatefulWidget {
  const ProfesorScreen({super.key});

  @override
  State<ProfesorScreen> createState() => _ProfesorScreenState();
}

class _ProfesorScreenState extends State<ProfesorScreen> {
  AgendaDB? agendaDB;

  @override
  void initState() {
    super.initState();
    agendaDB = AgendaDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profesores"),
        actions: [
          IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, '/addProfe').then((value) {
                    setState(() {});
                  }),
              icon: Icon(Icons.task))
        ],
      ),
      body: ValueListenableBuilder(
          valueListenable: GlobalValues.flagTask,
          builder: (context, value, _) {
            return FutureBuilder(
                future: agendaDB!.GETALLPROFESOR(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Profesor>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CardProfesorWidget(
                              profesor: snapshot.data![index],
                              agendaDB: agendaDB);
                        });
                  } else {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text("No hay nadie registrado"),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }
                });
          }),
    );
  }
}
