import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'reserve_verify.dart';

class ReserveForm extends StatelessWidget {
  ReserveForm({super.key, required this.date});

  DateTime date;
  String checkInDate = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('mui'),
      ),
      body: Container(
        color: Colors.grey,
        child: Center(

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
                              checkInDate = text;
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
                              }
                          ),
                      ],
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: (){
                        //  ボタンを押したときのアクションを書く
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ReserveVerifyPage(checkInDate: checkInDate == '' ? DateFormat('yyyy/MM/dd').format(date) : checkInDate )),
                        );
                      },
                      child: const Text('次へ'),
                    ),
                  ),
              ],
          ),
        ),
      ),
    );// This trailing comma makes auto-formatting nicer for build methods.
  }
}