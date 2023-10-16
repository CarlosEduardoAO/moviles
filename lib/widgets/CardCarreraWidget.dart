import 'package:flutter/material.dart';
import 'package:pmsn20232/assets/global_values.dart';
import 'package:pmsn20232/database/agenda_db.dart';
import 'package:pmsn20232/models/carrera_model.dart';
import 'package:pmsn20232/models/carrera_model.dart';
import 'package:pmsn20232/screens/add_task.dart';

class CardCarreraWidget extends StatefulWidget {
  const CardCarreraWidget(
      {super.key, required Carrera carreraModel, AgendaDB? agendaDB});

  @override
  State<CardCarreraWidget> createState() => _CardCarreraWidgetState();
}

class _CardCarreraWidgetState extends State<CardCarreraWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
