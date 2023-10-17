import 'package:flutter/material.dart';
import 'package:pmsn20232/assets/global_values.dart';
import 'package:pmsn20232/database/agenda_db.dart';
import 'package:pmsn20232/models/profesor_model.dart';
import 'package:pmsn20232/screens/add_profe.dart';

class CardProfesorWidget extends StatelessWidget {
  CardProfesorWidget({
    super.key,
    required this.profesor,
    this.agendaDB,
  });

  Profesor profesor;

  AgendaDB? agendaDB;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10),
      decoration: const BoxDecoration(color: Color.fromARGB(255, 7, 127, 255)),
      child: Row(
        children: [
          Column(
            children: [
              Text(profesor.nameProfe!),
              Text(profesor.email!),
              Text(profesor.idCarrera! as String),
            ],
          ),
          Expanded(child: Container()),
          Column(
            children: [
              GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AddProfesor(profesor: profesor))),
                  child: Image.asset(
                    'assets/fresa.png',
                    height: 50,
                  )),
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Mensaje del sistema'),
                          content: const Text('¿Deseas eliminar la tarea?'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  agendaDB!
                                      .DELETE('tblProfesor', profesor!.idProfe!)
                                      .then((value) {
                                    Navigator.pop(context);
                                    GlobalValues.flagTask.value =
                                        !GlobalValues.flagTask.value;
                                  });
                                },
                                child: Text('Si')),
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('No'))
                          ],
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.delete))
            ],
          )
        ],
      ),
    );
  }
}
