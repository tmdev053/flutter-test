import 'package:flutter/material.dart';
import 'package:sample01/pages/setting_page.dart';
import 'package:sample01/pages/top_page.dart';
import 'package:sample01/pages/reserve_list.dart';
import 'package:sample01/pages/user_page.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _Layout();
}

final _pages = [
  const TopPage(),
  const ReserveList(),
  const UserPage(),
  const SettingPage(),
];

class _Layout extends State<Layout> {
  int _selectedIndex = 0;

  void _onItemTapped(int index){
//  ここにアクションを書く
    setState(() {
      _selectedIndex = index;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('mui'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
                Icons.search
            ),
            label: '予約する',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                Icons.assignment
            ),
            label: '予約一覧',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                Icons.account_circle
            ),
            label: 'マイページ',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                Icons.more_horiz
            ),
            label: 'その他',
          ),
        ],
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}