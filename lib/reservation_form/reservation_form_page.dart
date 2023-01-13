import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sample01/add_reservation/add_reservation_page.dart';
import 'reservation_form_model.dart';

class ReservationFormPage extends StatelessWidget {
  ReservationFormPage({super.key, required this.date});

  DateTime date;

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => ReservationFormModel()..checkReservation(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('mui'),
        ),
        body: Container(
          color: Colors.blueGrey[50],
          child: Consumer<ReservationFormModel>(builder: (context, model, child){
            return Center(
              child: Column(
                children: [
                  Container(
                      height: 60,
                      width: double.infinity,
                      color: Colors.white,
                      child: Center(child: Text(DateFormat('yyyy/MM/dd').format(date)))
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Flexible(
                          child: TextFormField(
                            initialValue: DateFormat('yyyy/MM/dd').format(date),
                            onChanged: (text) {
                              model.checkInDate = text as DateTime?;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'チェックイン',
                            ),

                          ),
                        ),
                        IconButton(
                            icon: const Icon(Icons.calendar_today),
                            onPressed: () async {
                              //  アイコン押下時のイベント

                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Flexible(
                          child: TextFormField(
                            initialValue: DateFormat('yyyy/MM/dd').format(date),
                            onChanged: (text) {
                              model.checkOutDate = text as DateTime?;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'チェックアウト',
                            ),
                          ),
                        ),
                        IconButton(
                            icon: const Icon(Icons.calendar_today),
                            onPressed: () async {
                              //  アイコン押下時のイベント
                            }
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextFormField(
                      onChanged: (text) {
                        model.numberOfGuests = text;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '人数',
                      ),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: (){
                        //  ボタンを押したときのアクションを書く
                        model.checkReservation();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AddReservationPage(),
                          ),
                        );
                      },
                      child: const Text('次へ'),
                    ),
                  ),
                ],
              ),
            );
          }),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}