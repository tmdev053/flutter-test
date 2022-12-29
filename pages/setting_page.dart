import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

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
                      child: Text('その他・設定',
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
                  child: const Text('問い合わせ'),
                ),
              ),
            ],
          ),
        ),
      ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}