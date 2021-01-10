import 'package:flutter/material.dart';
import 'package:leyoplanner/AppFile/Ekipler.dart';
import 'package:leyoplanner/AppFile/Gorevler.dart';
import 'package:leyoplanner/AppFile/Projeler.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);
  //super temel sınıfın yapıcısını çağırmak için kullanılır.
  //Key Flutter'da widget'ları tanımlamak için kullanılan bir türdür ve Flutter'ın
  //ağaçta taşınan bir widget'in daha önce farklı bir konumda bulunan bir widget
  //ile aynı olduğunu bilmesini sağlar.

  @override
  State<StatefulWidget> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();
  List<Widget> _screens = [GorevlerPage(), ProjelerPage(), EkiplerPage()];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list,
                color: _selectedIndex == 0 ? Colors.black : Colors.lightBlue),
            label: ' ',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_tree,
                  color: _selectedIndex == 1 ? Colors.black : Colors.lightBlue),
              label: ' '),
          BottomNavigationBarItem(
              icon: Icon(Icons.people,
                  color: _selectedIndex == 2 ? Colors.black : Colors.lightBlue),
              label: ' '),
        ],
      ),
    );
  }
}
