import 'package:flutter/material.dart';


class ReserveList extends StatefulWidget {
  const ReserveList({super.key});

  @override
  State<ReserveList> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ReserveList> {

  @override
  Widget build(BuildContext context) {

    return Container(
        color: Colors.grey,
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
              Center(
                child: ElevatedButton(
                  onPressed: (){
                    //  ボタンを押したときのアクションを書く
                  },
                  child: const Text('キャンセル'),
                ),
              ),
            ],
          ),
        ),
      );
  }
}