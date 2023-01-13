import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sample01/add_reservation/add_reservation_model.dart';

class AddReservationPage extends StatelessWidget {
  const AddReservationPage({super.key});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
        create: (_) => AddReservationModel()..addReservation(),
        child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('mui'),
        ),
        body: Container(
          color: Colors.blueGrey[50],
          child: Consumer<AddReservationModel>(builder: (context, model, child){
            return Center(
                child: Column(
                  children: [
                    Container(
                        height: 60,
                        width: double.infinity,
                        color: Colors.white,
                        child: const Center(child: Text("予約内容確認"))
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextFormField(
                        readOnly: true,
                        initialValue: DateFormat('yyyy/MM/dd').format(model.checkInDate),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'チェックイン',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextFormField(
                        readOnly: true,
                        initialValue: DateFormat('yyyy/MM/dd').format(model.checkOutDate),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'チェックアウト',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextFormField(
                        readOnly: true,
                        initialValue: model.numberOfGuests,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '人数',
                        ),
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          try {
                            await model.addReservation();
                            final snackBar = SnackBar(
                              backgroundColor: Colors.green,
                              content: Text('予約しました'),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          } catch(e){
                            final snackBar = SnackBar(
                              content: Text(e.toString()),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                        },
                        child: const Text('確定'),
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