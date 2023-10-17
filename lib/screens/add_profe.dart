import 'package:flutter/material.dart';
import 'package:pmsn20232/assets/global_values.dart';
import 'package:pmsn20232/database/agenda_db.dart';
import 'package:pmsn20232/models/profesor_model.dart';
import 'package:pmsn20232/widgets/dropdown_widget.dart';

class AddProfesor extends StatefulWidget {
  AddProfesor({super.key, this.profesor});

  Profesor? profesor;

  @override
  State<AddProfesor> createState() => _AddProfesorState();
}

class _AddProfesorState extends State<AddProfesor> {
  TextEditingController txtConName = TextEditingController();
  TextEditingController txtConEmail = TextEditingController();
  TextEditingController txtConIdCarrera = TextEditingController();

  AgendaDB? agendaDB;
  DropDownWidget? widgetabajo;
  @override
  void initState() {
    super.initState();
    agendaDB = AgendaDB();
    if (widget.profesor != null) {
      txtConName.text = widget.profesor!.nameProfe!;
      txtConEmail.text = widget.profesor!.email!;
      txtConIdCarrera.text = widget.profesor!.idCarrera! as String;
      widgetabajo = DropDownWidget(
          values: ['Sistemas', 'Industrial', 'Gestion', 'Mecanica'],
          controller: 'Sistemas');
    } else {
      widgetabajo = DropDownWidget(
          values: ['Sistemas', 'Industrial', 'Gestion', 'Mecanica'],
          controller: 'Sistemas');
    }
  }

  @override
  Widget build(BuildContext context) {
    final txtName = TextField(
      decoration: const InputDecoration(
          label: Text('Nombre profesor'), border: OutlineInputBorder()),
      controller: txtConName,
    );
    final txtEmail = TextField(
      decoration: const InputDecoration(
          label: Text('Email'), border: OutlineInputBorder()),
      controller: txtConEmail,
    );

    final space = SizedBox(height: 10);

    final ElevatedButton btnGuardar = ElevatedButton(
        onPressed: () {
          if (widget.profesor == null) {
            agendaDB!.INSERT('tblProfesor', {
              'nameProfe': txtConName.text,
              'email': txtConEmail.text,
              'idCarrera': widgetabajo!.indexSelected
            }).then((value) {
              var msj = (value > 0) ? 'La insercion fue correcta' : 'Error';
              var snackBar = const SnackBar(content: Text('Profesor saved'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Navigator.pop(context);
            });
          } else {
            agendaDB!.UPDATE('tblProfesor', {
              'idProfe': widget.profesor!.idProfe,
              'nameProfe': txtConName.text,
              'email': txtConEmail.text,
              //'sttTask': dropDownValue!.substring(0,1)
            }).then((value) {
              GlobalValues.flagTask.value = !GlobalValues.flagTask.value;
              var msj = (value > 0) ? 'La insercion fue correcta' : 'Error';
              var snackBar = const SnackBar(content: Text('Profesor saved'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Navigator.pop(context);
            });
          }
        },
        child: Text('Save Profesor'));

    return Scaffold(
      appBar: AppBar(
          title: widget.profesor == null
              ? Text('Add Profesor')
              : Text('Update Profesor')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            txtName,
            space,
            txtEmail,
            space,
            widgetabajo!,
            space,
            //ddBStatus,
            btnGuardar
          ],
        ),
      ),
    );
  }
}
