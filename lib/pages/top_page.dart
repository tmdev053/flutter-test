import 'package:flutter/material.dart';
import '../reserve_form.dart';
import 'package:table_calendar/table_calendar.dart';

DateTime _focused = DateTime.now();
DateTime? _selected;

class TopPage extends StatefulWidget{
  const TopPage({super.key});

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {

  @override
  Widget build(BuildContext context) {

    return Container(
        color: Colors.blueGrey[50],
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: TableCalendar(
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    rowHeight: 70,
                    daysOfWeekHeight: 32,
                    calendarStyle: const CalendarStyle(
                        defaultDecoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Colors.blue,
                              width: 1,
                            ),
                            right: BorderSide(
                              color: Colors.blue,
                              width: 1,
                            ),
                          ),
                        ),
                        todayDecoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Colors.blue,
                              width: 1,
                            ),
                            right: BorderSide(
                              color: Colors.blue,
                              width: 1,
                            ),
                          ),
                        ),
                        outsideDecoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Colors.blue,
                              width: 1,
                            ),
                            right: BorderSide(
                              color: Colors.blue,
                              width: 1,
                            ),
                          ),
                        ),
                        weekendDecoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Colors.blue,
                              width: 1,
                            ),
                            right: BorderSide(
                              color: Colors.blue,
                              width: 1,
                            ),
                          ),
                        ),
                        selectedDecoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Colors.blue,
                              width: 1,
                            ),
                            right: BorderSide(
                              color: Colors.blue,
                              width: 1,
                            ),
                          ),
                        ),
                        selectedTextStyle: TextStyle(color: Colors.black),
                        todayTextStyle: TextStyle(color: Colors.black),
                        cellMargin: EdgeInsets.all(2.5),
                    ),

                    firstDay: DateTime(DateTime.now().year - 1),
                    lastDay: DateTime(DateTime.now().year + 2),
                    locale: 'ja_JP',
                    selectedDayPredicate: (day) {
                      return isSameDay(_selected, day);
                    },
                    onDaySelected: (selected, focused) {
                      if (!isSameDay(_selected, selected)) {
                        setState(() {
                          _selected = selected;
                          _focused = focused;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReserveForm(date: selected),
                            fullscreenDialog: true,
                          ),
                        );
                      }
                    },
                    focusedDay: _focused,
                  ),
                ),
              ]),
          ),
          ),
        );
     // This trailing comma makes auto-formatting nicer for build methods.
  }
}
