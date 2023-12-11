import 'package:flutter/material.dart';
import 'package:mobel_geming/pages/home_page.dart';
import 'package:mobel_geming/pages/profilepage.dart';
import 'package:mobel_geming/pages/task_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBar createState() => _BottomNavBar();
}

class _BottomNavBar extends State<BottomNavBar> {
  int _selectedIndex = 0; // Index halaman yang aktif

  // Daftar halaman yang akan ditampilkan di BottomNavigationBar
  final List<Widget> _pages = [
    HomePage(),
    TaskPage(),
    ProfilePage(),
  ];

  // Fungsi untuk mengganti halaman saat item BottomNavigationBar ditekan
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('My App'),
        // ),
        body: _pages[_selectedIndex], // Tampilkan halaman yang dipilih
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Task'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
