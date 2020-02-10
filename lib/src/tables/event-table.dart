import 'dart:convert';

import 'package:flutter_web/material.dart';
import 'package:http/http.dart' as http;
import 'package:together_admin/src/models/event-model.dart';
import 'package:together_admin/src/tables/add_event.dart';

class EventTable extends StatefulWidget {
  EventTable() : super();

  @override
  EventTableState createState() => EventTableState();
}

class EventTableState extends State<EventTable> {
  List<Event> events;
  List<Event> selectedEvents;
  bool sort;

  @override
  void initState() {
    super.initState();
    sort = false;
    selectedEvents = [];
    events = [];
  }

  onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        events.sort((a, b) => a.title.compareTo(b.title));
      } else {
        events.sort((a, b) => b.title.compareTo(a.title));
      }
    }
  }

  onSelectedRow(bool selected, Event user) async {
    setState(() {
      if (selected) {
        selectedEvents.add(user);
      } else {
        selectedEvents.remove(user);
      }
    });
  }

  deleteSelected() async {
    if (selectedEvents.isNotEmpty) {
      List<Event> temp = [];
      temp.addAll(selectedEvents);
      for (Event event in temp) {
        var url = 'http://84.201.185.226:8080/v1/event/remove';
        var response = await http.post(url,
            headers: {
              'Content-Type': 'application/json; charset=utf-8',
              'Accept': 'application/json; charset=utf-8'
            },
            body: jsonEncode({
              'title': event.title,
            }));
      }
    }
    var url = 'http://84.201.185.226:8080/v1/event/list';
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json; charset=utf-8',
      'Accept': 'application/json; charset=utf-8'
    });

    var events = List<Event>();

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        events.add(Event.map(noteJson));
      }
    }
    setState(() {
      this.events = events;
    });
  }

  SingleChildScrollView dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        sortAscending: sort,
        sortColumnIndex: 0,
        columns: [
          DataColumn(
              label: Text("Название"),
              numeric: false,
              tooltip: "Название",
              onSort: (columnIndex, ascending) {
                setState(() {
                  sort = !sort;
                });
                onSort(columnIndex, ascending);
              }),
          DataColumn(
            label: Text("Место"),
            numeric: true,
            tooltip: "Место",
          ),
          DataColumn(
            label: Text("Дата"),
            numeric: false,
            tooltip: "Дата",
          ),
          DataColumn(
            label: Text("Описание"),
            numeric: false,
            tooltip: "Описание",
          ),
          DataColumn(
            label: Text("Ticketcloud"),
            numeric: false,
            tooltip: "Ticketcloud",
          ),
          DataColumn(
            label: Text("Изображение"),
            numeric: false,
            tooltip: "Изображение",
          ),
          DataColumn(
            label: Text("Видео"),
            numeric: false,
            tooltip: "Видео",
          ),
        ],
        rows: events
            .map((event) => DataRow(
                    selected: selectedEvents.contains(event),
                    onSelectChanged: (b) {
                      print("Onselect");
                      onSelectedRow(b, event);
                    },
                    cells: [
                      DataCell(
                        Text(event.title),
                        onTap: () {
                          print('Selected ${event.title}');
                        },
                      ),
                      DataCell(
                        Text(event.place),
                      ),
                      DataCell(
                        Text(event.date),
                      ),
                      DataCell(
                        Text(event.description),
                      ),
                      DataCell(
                        Text(event.ticketcloud),
                      ),
                      DataCell(
                        Text("-"),
                      ),
                      DataCell(
                        Text("-"),
                      ),
                    ]))
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Expanded(
            child: dataBody(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('Все мероприятия'),
                  onPressed: () async {
                    var url = 'http://84.201.185.226:8080/v1/event/list/all';
                    var response = await http.get(url, headers: {
                      'Content-Type': 'application/json; charset=utf-8',
                      'Accept': 'application/json; charset=utf-8'
                    });

                    var events = List<Event>();

                    if (response.statusCode == 200) {
                      var notesJson = json.decode(response.body);
                      for (var noteJson in notesJson) {
                        events.add(Event.map(noteJson));
                      }
                    }
                    setState(() {
                      this.events = events;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('Будущие'),
                  onPressed: () async {
                    var url = 'http://84.201.185.226:8080/v1/event/list/future';
                    var response = await http.get(url, headers: {
                      'Content-Type': 'application/json; charset=utf-8',
                      'Accept': 'application/json; charset=utf-8'
                    });

                    var events = List<Event>();

                    if (response.statusCode == 200) {
                      var notesJson = json.decode(response.body);
                      for (var noteJson in notesJson) {
                        events.add(Event.map(noteJson));
                      }
                    }
                    this.events = events;
                    setState(() {
                      this.events = events;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('Прошедшие'),
                  onPressed: () async {
                    var url = 'http://84.201.185.226:8080/v1/event/list/past';
                    var response = await http.get(url, headers: {
                      'Content-Type': 'application/json; charset=utf-8',
                      'Accept': 'application/json; charset=utf-8'
                    });

                    var events = List<Event>();

                    if (response.statusCode == 200) {
                      var notesJson = json.decode(response.body);
                      for (var noteJson in notesJson) {
                        events.add(Event.map(noteJson));
                      }
                    }
                    this.events = events;
                    setState(() {
                      this.events = events;
                    });
                  },
                ),
              ),
              SizedBox(width: 280),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('Удалить'),
                  onPressed: () {
                    deleteSelected();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('Редактировать'),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('Добавить новоe'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) =>
                                AddEvent()));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
