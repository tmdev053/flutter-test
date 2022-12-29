import 'package:flutter/material.dart';


class ReserveVerifyPage extends StatelessWidget {
  const ReserveVerifyPage({super.key, required this.checkInDate});

  final String checkInDate;

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
                  child: Center(child: Text(checkInDate))
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  initialValue: checkInDate,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'チェックイン',
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: (){
                    //  ボタンを押したときのアクションを書く
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