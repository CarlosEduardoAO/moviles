import 'package:flutter/material.dart';
import 'package:pmsn20232/assets/global_values.dart';
import 'package:pmsn20232/database/agenda_db.dart';
import 'package:pmsn20232/models/carrera_model.dart';

class AddCarrera extends StatefulWidget {
  AddCarrera({super.key, this.carreraModel});

  Carrera? carreraModel;

  @override
  State<AddCarrera> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddCarrera> {
  TextEditingController txtConName = TextEditingController();
  TextEditingController txtConId = TextEditingController();

  AgendaDB? agendaDB;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    agendaDB = AgendaDB();
    if (widget.carreraModel != null) {
      txtConName.text = widget.carreraModel!.nameCarrera!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final txtNameCarrera = TextFormField(
      decoration: const InputDecoration(
          label: Text('Carrera'), border: OutlineInputBorder()),
      controller: txtConName,
    );
    const space = SizedBox(
      height: 10,
    );

    final ElevatedButton btnGuardar = ElevatedButton(
        onPressed: () {
          if (widget.carreraModel == null) {
            agendaDB!.INSERT('tblCarrera', {
              'nameCarrera': txtConName.text,
            }).then((value) {
              var msj = (value > 0)
                  ? 'La inserción fue exitosa!'
                  : 'Ocurrió un error';
              var snackbar = SnackBar(content: Text(msj));
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
              Navigator.pop(context);
            });
          } else {
            agendaDB!.UPDATE('tblCarrera', {
              'idCarrera': widget.carreraModel!.idCarrera,
              'nameCarrera': txtConName.text,
            }).then((value) {
              GlobalValues.flagTask.value = !GlobalValues.flagTask.value;
              var msj = (value > 0)
                  ? 'La actualización fue exitosa!'
                  : 'Ocurrió un error';
              var snackbar = SnackBar(content: Text(msj));
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
              Navigator.pop(context);
            });
          }
        },
        child: Text('Save Task'));

    return Scaffold(
      appBar: AppBar(
        title: widget.carreraModel == null
            ? Text('Add Task')
            : Text('Update Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            txtNameCarrera,
            space,
            btnGuardar,
          ],
        ),
      ),
    );
  }
}
