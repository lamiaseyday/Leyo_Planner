import 'package:flutter/material.dart';
import 'package:leyoplanner/AppFile/dialog/dialoglar.dart';

class GorevlerPage extends StatefulWidget {
  GorevlerPage({Key key}) : super(key: key);

  @override
  _GorevlerPageState createState() => _GorevlerPageState();
}

class _GorevlerPageState extends State<GorevlerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gorevler"),
      ),
      floatingActionButton: FloatingActionButton(
        //fonksiyonda await çağırabilmek içinde fonksiyonun async olarak tanımlanmalı
        onPressed: () async {
          //showdialog future döndüğü için await yazmalıyız.
          String itemName = await showDialog(
              context: context, builder: (BuildContext context) => Dialoglar());
          //print(itemName);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
