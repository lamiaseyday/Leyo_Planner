import 'package:flutter/material.dart';

class FavorilerPage extends StatefulWidget {
  FavorilerPage({Key key}) : super(key: key);

  @override
  _FavorilerPageState createState() => _FavorilerPageState();
}

class _FavorilerPageState extends State<FavorilerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favoriler"),
      ),
    );
  }
}
