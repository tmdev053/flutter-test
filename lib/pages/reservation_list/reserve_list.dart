import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sample01/domain/reservation.dart';
import 'package:sample01/pages/reservation_list/reserve_list_model.dart';


class ReserveList extends StatelessWidget {
  const ReserveList({super.key});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<ReserveListModel>(
      create: (_)=> ReserveListModel()..fetchReservationList(),
      child: Container(
          color: Colors.blueGrey[50],
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 60,
                  width: double.infinity,
                  color: Colors.white,
                  child: const Center(
                      child: Text('予約一覧',
                          style: TextStyle(
                            fontSize: 20,
                          )
                      )
                  )
                ),
                Consumer<ReserveListModel>(builder: (context, model, child){
                    final List<Reservation>? reservations = model.reservations;

                    if(reservations == null) {
                      return const Card(
                        child: ListTile(
                          title: Text('現在予約している日程はありません')
                        ),
                      );
                    }
                    final List<Widget> widgets = reservations.map((reservation)=> Card(
                      child: ListTile(
                          title: Text("${DateFormat('yyyy/MM/dd').format(reservation.checkInDate)} ~ ${DateFormat('yyyy/MM/dd').format(reservation.checkOutDate)}"),
                          subtitle: Text("人数：${reservation.numberOfGuests}名"),
                          trailing: ElevatedButton(
                            onPressed: ()async {
                              //  ボタンを押したときのアクションを書く
                              await showConfirmDialog(context, reservation, model);
                            },
                            child: const Text('キャンセル'),
                          ),
                      ),
                    )).toList().cast();
                    return Expanded(
                      child: ListView(
                          children: widgets,
                      ),
                    );
                }),
              ]
            ),
          ),
      ),
    );
  }
  Future showConfirmDialog(BuildContext context, Reservation reservation, ReserveListModel model){
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: const Text("キャンセルの確認"),
          content: SizedBox(
            height: 100,
            child: Column(
              children: [
                Card(
                  color: Colors.blue[50],
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            children: [
                              Text("${DateFormat('yyyy/MM/dd').format(
                                  reservation.checkInDate)} ~ ${DateFormat('yyyy/MM/dd')
                                  .format(reservation.checkOutDate)}"),
                              Text("人数：${reservation.numberOfGuests}名"),
                            ],
                        ),
                    )
                ),
                const Text("キャンセルしますか？"),
                const Text(
                  "キャンセル後のデータ更新に数分かかることがございます",
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text("いいえ"),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text("はい"),
              onPressed: () async {
                try{
                  await model.deleteReservation(reservation);
                  // ページ遷移
                  Navigator.pop(context);

                  final snackBar = SnackBar(
                    backgroundColor: Colors.red,
                    content: Text("予約をキャンセルしました"),
                  );
                  // 一覧の再取得
                  model.fetchReservationList();
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } catch(e){
                  // 失敗表示
                  final snackBar = SnackBar(
                      content: Text(e.toString()),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
            ),
          ],
        );
      }
    );
  }
}