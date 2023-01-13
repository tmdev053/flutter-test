import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'components/Layout.dart';



class ReserveVerifyPage extends StatelessWidget {
  const ReserveVerifyPage({super.key, required this.checkInDate, required this.checkOutDate, required this.numberOfGuests});

  final String checkInDate;
  final String checkOutDate;
  final String numberOfGuests;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('mui'),
      ),
      body: Container(
        color: Colors.blueGrey[50],
        child: Center(

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
                  initialValue: checkInDate,
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
                  initialValue: checkOutDate,
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
                  initialValue: numberOfGuests,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '人数',
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    //  ボタンを押したときのアクションを書く
                    try {
                      // フォーマット変換
                      var checkInDateToStr = checkInDate.replaceAll('/', '-');
                      var checkOutDateToStr = checkOutDate.replaceAll('/', '-');

                      DateTime parsedCheckInDate = DateTime.parse(checkInDateToStr);
                      DateTime parsedCheckOutDate = DateTime.parse(checkOutDateToStr);

                      Timestamp formattedCheckInDate = Timestamp.fromDate(parsedCheckInDate);
                      Timestamp formattedCheckOutDate = Timestamp.fromDate(parsedCheckOutDate);

                      // Firestoreに追加
                      await FirebaseFirestore.instance.collection('reservations').add({
                        'checkInDate': formattedCheckInDate,
                        'checkOutDate': formattedCheckOutDate,
                        'numberOfGuests': numberOfGuests,
                      });
                      // 成功表示
                      final snackBar = SnackBar(
                        backgroundColor: Colors.green,
                        content: Text('予約しました'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      // ページ遷移
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Layout(),
                        ),
                      );
                    } catch(e){
                      // 失敗表示
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
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}