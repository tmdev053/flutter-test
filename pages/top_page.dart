import 'package:flutter/material.dart';
// import 'package:sample01/calender.dart';
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
        color: Colors.grey,
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
                    firstDay: DateTime.utc(2022, 10, 1),
                    lastDay: DateTime.utc(2023, 2, 10),
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
                          MaterialPageRoute(builder: (context) => ReserveForm(date: selected)),
                        );
                      }
                    },
                    focusedDay: _focused,
                  ),
                ),
                // const Center(
                //     child: CalendarPage()
                // ),
              ]),
          ),
          ),
        );
     // This trailing comma makes auto-formatting nicer for build methods.
  }
}
