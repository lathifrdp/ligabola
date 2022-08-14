import 'package:flutter/material.dart';
import 'package:liga_bola/src/helper/theme_colors.dart';
import 'package:liga_bola/src/ui/liga_page.dart';
import 'package:liga_bola/src/ui/profil_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<Widget> _listPage = [
    const LigaPage(),
    const ProfilPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _listPage[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
          // elevation: 0,
          // backgroundColor: whiteColor,
          selectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: grayColor60,
                ),
                activeIcon: const Icon(Icons.home),
                label: "Beranda"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: grayColor60,
                ),
                activeIcon: const Icon(Icons.person),
                label: "Profil"),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: hijauTua,
          onTap: _onItemTapped),
    );
  }
}
