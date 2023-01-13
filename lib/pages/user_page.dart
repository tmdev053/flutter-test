import 'package:flutter/material.dart';


class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
        color: Colors.blueGrey[50],
        child: Center(
          child: Column(
            children: [
              Container(
                  height: 60,
                  width: double.infinity,
                  color: Colors.white,
                  child: const Center(
                      child: Text('マイページ',
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
                  child: const Text('変更'),
                ),
              ),
            ],
          ),
        ),
      ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}