import 'package:flutter/material.dart';
import 'package:leyoplanner/AppFile/EkiplerPage.dart';
import 'package:leyoplanner/AppFile/GorevlerPage.dart';
import 'package:leyoplanner/AppFile/ProjelerPage.dart';
import 'package:leyoplanner/http/item_service.dart';
import 'package:leyoplanner/model/item.dart';

import 'dialog/item_dialog.dart';

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
  final PageController _pageController = PageController();
  ItemService _itemService;

  @override
  void initState() {
    _itemService = ItemService();
    _pageController.addListener(() {
      int currenIndex = _pageController.page.round();
      if (currenIndex != _selectedIndex) {
        _selectedIndex = currenIndex;

        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leyo'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            String itemName = await showDialog(
                context: context,
                builder: (BuildContext context) => ItemDialog());

            if (itemName.isNotEmpty) {
              var item =
                  Item(name: itemName, isCompleted: false, isArchived: false);

              setState(() {});
              _itemService.addItem(item.toJson());
            }
          },
          child: Icon(Icons.add)),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.list), title: Text('Görevler')),
          BottomNavigationBarItem(
              icon: Icon(Icons.people), title: Text('Ekipler')),
          BottomNavigationBarItem(
              icon: Icon(Icons.next_plan), title: Text('Projeler')),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTap,
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          GorevlerPage(),
          EkiplerPage(),
          ProjelerPage(),
        ],
      ),
    );
  }

  void _onTap(int value) {
    setState(() {
      _selectedIndex = value;
    });

    _pageController.jumpToPage(value);
  }
}
