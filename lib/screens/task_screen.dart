import 'package:flutter/material.dart';
import 'package:pmsn20232/assets/global_values.dart';
import 'package:pmsn20232/database/agenda_db.dart';
import 'package:pmsn20232/models/task_models.dart';
import 'package:pmsn20232/widgets/CardTaskWidget.dart';
import 'package:pmsn20232/widgets/dropdown_widget.dart';
import 'package:pmsn20232/widgets/filter_text_dialog.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  AgendaDB? agendaDB;
  List<String> dropDownValues = [];
  DropDownWidget? dropDownFilter;
  FilterTextWidget? filterText;
  String filtro = "Todo";

  @override
  void initState() {
    super.initState();
    agendaDB = AgendaDB();
    dropDownValues = ['Pendiente', 'Completado', 'En proceso', 'Todo'];
    dropDownFilter = DropDownWidget(controller: 'Todo', values: dropDownValues);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tareas"),
        actions: [
          IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, '/add').then((value) {
                    setState(() {});
                  }),
              icon: Icon(Icons.task)),
          DropdownButton<String>(
            value: filtro,
            icon: const Icon(Icons.filter_list),
            onChanged: (String? newValue) {
              setState(() {
                filtro = newValue!;
              });
            },
            items: <String>['Pendiente', 'Completado', 'En proceso', 'Todo']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
      body: ValueListenableBuilder(
          valueListenable: GlobalValues.flagTask,
          builder: (context, value, _) {
            return FutureBuilder(
                future: _getTareas(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<TaskModel>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CardTaskWidget(
                              taskModel: snapshot.data![index],
                              agendaDB: agendaDB);
                        });
                  } else {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text("Something was wrong"),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }
                });
          }),
    );
  }

  Future<List<TaskModel>> _getTareas() {
    switch (filtro) {
      case 'Completado':
        return agendaDB!.ListarTareasRealizadas();
      case 'Pendiente':
        return agendaDB!.ListarTareasPendientes();
      case 'En proceso':
        return agendaDB!.ListarTareasProceso();
      default:
        return agendaDB!.GETALLTASK();
    }
  }
}
